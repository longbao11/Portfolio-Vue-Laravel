<script setup lang="ts">
import Footer from '@/components/Frontend/Footer.vue';
import Header from '@/components/Frontend/Header.vue';
</script>

<template>
    <div
        class="flex flex-col min-h-screen bg-gradient-to-br from-slate-100 to-slate-300 dark:bg-slate-900 overflow-hidden">

        <!-- Header -->
        <Header />

        <!-- Page Content -->
        <main class="flex-grow">
            <slot />
        </main>

        <!-- Footer -->
        <Footer />
    </div>
</template>
