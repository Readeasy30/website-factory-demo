// ===== DOM Elements =====
const hamburger = document.getElementById('hamburger');
const navLinks = document.getElementById('nav-links');
const form = document.getElementById('contactForm');
const formStatus = document.getElementById('formStatus');
const navlinks = document.querySelectorAll('.nav-links a');

// ===== Mobile Navigation =====
hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    navLinks.classList.toggle('show');
});

document.addEventListener('click', (e) => {
    if (!hamburger.contains(e.target) && !navLinks.contains(e.target)) {
        hamburger.classList.remove('active');
        navLinks.classList.remove('show');
    }
});

// ===== Smooth Navigation Highlight =====
const sections = document.querySelectorAll('section');
window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(section => {
        const sectionTop = section.offsetTop - 100;
        if (window.scrollY >= sectionTop) {
            current = section.getAttribute('id');
        }
    });
    navlinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === '#' + current) {
            link.classList.add('active');
        }
    });
});

// ===== Testimonials Data & Render =====
const testimonials = [
    {
        text: 'Automation Test Client completely transformed our QA process. Their expertise in CI/CD integration saved us hours every week.',
        name: 'Sarah Mitchell',
        position: 'CTO, DrawBridge Solutions'
    },
    {
        text: 'Professional, responsive, and highly skilled. They built a robust automation framework that caught critical bugs before release.',
        name: 'James O\'Connell',
        position: 'Product Lead, Starlight Software'
    },
    {
        text: 'We needed a partner who understood both automation and our local business needs. They delivered beyond expectations.',
        name: 'Maria Alvarez',
        position: 'QA Manager, Vertex Systems'
    }
];

const testimonialsGrid = document.getElementById('testimonialsGrid');
function renderTestimonials() {
    testimonialsGrid.innerHTML = testimonials.map(t => `
        <div class="testimonial-card">
            <p>"${t.text}"</p>
            <h4>â ${t.name}</h4>
            <span>${t.position}</span>
        </div>
    `).join('');
}
renderTestimonials();

// ===== Animated Statistics Count Up =====
function animateStats() {
    const statNumbers = document.querySelectorAll('.stat-number');
    statNumbers.forEach(stat => {
        const target = parseInt(stat.getAttribute('data-target'));
        const increment = target / 60;
        let current = 0;
        const updateValue = () => {
            current += increment;
            if (current < target) {
                stat.textContent = Math.floor(current);
                requestAnimationFrame(updateValue);
            } else {
                stat.textContent = target;
            }
        };
        updateValue();
    });
}

// Trigger animation when about section is visible
const aboutSection = document.getElementById('about');
let statsAnimated = false;

const observerOptions = {
    threshold: 0.3,
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting && !statsAnimated) {
            statsAnimated = true;
            animateStats();
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

if (aboutSection) observer.observe(aboutSection);

// ===== Contact Form Handling =====
form.addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const name = form.querySelector('input[name="name"]').value.trim();
    const email = form.querySelector('input[name="email"]').value.trim();
    const message = form.querySelector('textarea[name="message"]').value.trim();
    
    // Basic validation
    if (!name || !email || !message) {
        formStatus.textContent = 'Please fill out all required fields.';
        formStatus.className = 'form-status error';
        return;
    }
    
    if (!/\S+@\S+\.\S+/.test(email)) {
        formStatus.textContent = 'Please enter a valid email address.';
        formStatus.className = 'form-status error';
        return;
    }
    
    formStatus.textContent = 'Sending your message...';
    formStatus.className = 'form-status';
    
    try {
        // Simulate sending (replace with actual form action later)
        await new Promise(resolve => setTimeout(resolve, 1500));
        
        formStatus.textContent = 'Thank you! We will get back to you within 24 hours.';
        formStatus.className = 'form-status success';
        form.reset();
    } catch (err) {
        formStatus.textContent = 'Something went wrong. Please try again later.';
        formStatus.className = 'form-status error';
    }
});

// ===== Fade-in Animations =====
const animateOnScroll = () => {
    const elements = document.querySelectorAll('.service-card, .testimonial-card, .info-item, .stat, .contact-form input, .contact-form textarea');
    elements.forEach(el => {
        const rect = el.getBoundingClientRect();
        if (rect.top < window.innerHeight - 60) {
            el.classList.add('fade-in', 'visible');
        } else {
            el.classList.add('fade-in');
        }
    });
};

window.addEventListener('scroll', animateOnScroll);
window.addEventListener('load', animateOnScroll);

// ===== Set current year in footer =====
document.querySelector('.footer-copy').innerHTML = `&copy; ${new Date().getFullYear()} Automation Test Client. All rights reserved. Hillsboro, MO.`;

// ===== Intersection Observer for animations (fallback) =====
const animationObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, { threshold: 0.1 });

document.querySelectorAll('.fade-in').forEach(el => animationObserver.observe(el));
