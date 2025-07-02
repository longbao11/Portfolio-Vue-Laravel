<script setup lang="ts">
import About from '@/components/Frontend/About.vue';
import Hero from '@/components/Frontend/Hero.vue';
import FrontendLayout from '@/layouts/Frontend.vue';
import { Head, Link } from '@inertiajs/vue3';
import Services from '@/components/Frontend/Services.vue';
import Experience from '@/components/Frontend/Experience.vue';
import Contact from '@/components/Frontend/Contact.vue';
</script>

<template>

    <Head title="Portfolio">
        <link rel="preconnect" href="https://rsms.me/" />
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
    </Head>
    <FrontendLayout>
        <!-- Profile Section -->
        <Hero />
        <!-- Services -->
        <Services />
        <!-- About -->
        <About />
        <!-- Experience -->
        <Experience />
        <!-- Contact -->
        <Contact />
    </FrontendLayout>
</template>
