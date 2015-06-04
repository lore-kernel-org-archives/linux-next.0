From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with the tip tree
Date: Thu, 4 Jun 2015 16:55:29 +1000
Message-ID: <20150604165529.04d35606@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//MeX7p/BC111kDOgAdi1Zp7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60504 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751827AbbFDGzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 02:55:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_//MeX7p/BC111kDOgAdi1Zp7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in
arch/x86/Kconfig between commit 6471b825c41e ("x86/kconfig: Reorganize
arch feature Kconfig select's") from the tip tree and commit
b01aec9b2c7d ("EDAC: Cleanup atomic_scrub mess") from the edac-amd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/Kconfig
index 76be12d596a1,482c160a9fe9..000000000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -17,111 -22,61 +17,113 @@@ config X86_6
  ### Arch settings
  config X86
  	def_bool y
 -	select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
 -	select ARCH_MIGHT_HAVE_ACPI_PDC if ACPI
 +	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
 +	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 +	select ANON_INODES
 +	select ARCH_CLOCKSOURCE_DATA
 +	select ARCH_DISCARD_MEMBLOCK
 +	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
  	select ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS
 +	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_FAST_MULTIPLIER
  	select ARCH_HAS_GCOV_PROFILE_ALL
 +	select ARCH_HAS_SG_CHAIN
 +	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 +	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
  	select ARCH_MIGHT_HAVE_PC_PARPORT
  	select ARCH_MIGHT_HAVE_PC_SERIO
 -	select HAVE_AOUT if X86_32
 -	select HAVE_UNSTABLE_SCHED_CLOCK
 -	select ARCH_SUPPORTS_NUMA_BALANCING if X86_64
 -	select ARCH_SUPPORTS_INT128 if X86_64
 -	select HAVE_IDE
 -	select HAVE_OPROFILE
 -	select HAVE_PCSPKR_PLATFORM
 -	select HAVE_PERF_EVENTS
 -	select HAVE_IOREMAP_PROT
 -	select HAVE_KPROBES
 -	select HAVE_MEMBLOCK
 -	select HAVE_MEMBLOCK_NODE_MAP
 -	select ARCH_DISCARD_MEMBLOCK
 -	select ARCH_WANT_OPTIONAL_GPIOLIB
 +	select ARCH_SUPPORTS_ATOMIC_RMW
 +	select ARCH_SUPPORTS_INT128		if X86_64
 +	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 +	select ARCH_USE_BUILTIN_BSWAP
 +	select ARCH_USE_CMPXCHG_LOCKREF		if X86_64
 +	select ARCH_USE_QUEUED_RWLOCKS
 +	select ARCH_USE_QUEUED_SPINLOCKS
  	select ARCH_WANT_FRAME_POINTERS
 -	select HAVE_DMA_ATTRS
 -	select HAVE_DMA_CONTIGUOUS
 -	select HAVE_KRETPROBES
 +	select ARCH_WANT_IPC_PARSE_VERSION	if X86_32
 +	select ARCH_WANT_OPTIONAL_GPIOLIB
 +	select BUILDTIME_EXTABLE_SORT
 +	select CLKEVT_I8253
 +	select CLKSRC_I8253			if X86_32
 +	select CLOCKSOURCE_VALIDATE_LAST_CYCLE
 +	select CLOCKSOURCE_WATCHDOG
 +	select CLONE_BACKWARDS			if X86_32
 +	select COMPAT_OLD_SIGACTION		if IA32_EMULATION
 +	select DCACHE_WORD_ACCESS
++	select EDAC_ATOMIC_SCRUB
++	select EDAC_SUPPORT
 +	select GENERIC_CLOCKEVENTS
 +	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_A=
PIC)
 +	select GENERIC_CLOCKEVENTS_MIN_ADJUST
 +	select GENERIC_CMOS_UPDATE
 +	select GENERIC_CPU_AUTOPROBE
  	select GENERIC_EARLY_IOREMAP
 -	select HAVE_OPTPROBES
 -	select HAVE_KPROBES_ON_FTRACE
 -	select HAVE_FTRACE_MCOUNT_RECORD
 -	select HAVE_FENTRY if X86_64
 +	select GENERIC_FIND_FIRST_BIT
 +	select GENERIC_IOMAP
 +	select GENERIC_IRQ_PROBE
 +	select GENERIC_IRQ_SHOW
 +	select GENERIC_PENDING_IRQ		if SMP
 +	select GENERIC_SMP_IDLE_THREAD
 +	select GENERIC_STRNCPY_FROM_USER
 +	select GENERIC_STRNLEN_USER
 +	select GENERIC_TIME_VSYSCALL
 +	select HAVE_ACPI_APEI			if ACPI
 +	select HAVE_ACPI_APEI_NMI		if ACPI
 +	select HAVE_ALIGNED_STRUCT_PAGE		if SLUB
 +	select HAVE_AOUT			if X86_32
 +	select HAVE_ARCH_AUDITSYSCALL
 +	select HAVE_ARCH_HUGE_VMAP		if X86_64 || X86_PAE
 +	select HAVE_ARCH_JUMP_LABEL
 +	select HAVE_ARCH_KASAN			if X86_64 && SPARSEMEM_VMEMMAP
 +	select HAVE_ARCH_KGDB
 +	select HAVE_ARCH_KMEMCHECK
 +	select HAVE_ARCH_SECCOMP_FILTER
 +	select HAVE_ARCH_SOFT_DIRTY		if X86_64
 +	select HAVE_ARCH_TRACEHOOK
 +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 +	select HAVE_BPF_JIT			if X86_64
 +	select HAVE_CC_STACKPROTECTOR
 +	select HAVE_CMPXCHG_DOUBLE
 +	select HAVE_CMPXCHG_LOCAL
 +	select HAVE_CONTEXT_TRACKING		if X86_64
  	select HAVE_C_RECORDMCOUNT
 +	select HAVE_DEBUG_KMEMLEAK
 +	select HAVE_DEBUG_STACKOVERFLOW
 +	select HAVE_DMA_API_DEBUG
 +	select HAVE_DMA_ATTRS
 +	select HAVE_DMA_CONTIGUOUS
  	select HAVE_DYNAMIC_FTRACE
  	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 -	select HAVE_FUNCTION_TRACER
 -	select HAVE_FUNCTION_GRAPH_TRACER
 -	select HAVE_FUNCTION_GRAPH_FP_TEST
 -	select HAVE_SYSCALL_TRACEPOINTS
 -	select SYSCTL_EXCEPTION_TRACE
 -	select HAVE_KVM
 -	select HAVE_ARCH_KGDB
 -	select HAVE_ARCH_TRACEHOOK
 -	select HAVE_GENERIC_DMA_COHERENT if X86_32
  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 -	select USER_STACKTRACE_SUPPORT
 -	select HAVE_REGS_AND_STACK_ACCESS_API
 -	select HAVE_DMA_API_DEBUG
 -	select HAVE_KERNEL_GZIP
 +	select HAVE_FENTRY			if X86_64
 +	select HAVE_FTRACE_MCOUNT_RECORD
 +	select HAVE_FUNCTION_GRAPH_FP_TEST
 +	select HAVE_FUNCTION_GRAPH_TRACER
 +	select HAVE_FUNCTION_TRACER
 +	select HAVE_GENERIC_DMA_COHERENT	if X86_32
 +	select HAVE_HW_BREAKPOINT
 +	select HAVE_IDE
 +	select HAVE_IOREMAP_PROT
 +	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 +	select HAVE_IRQ_TIME_ACCOUNTING
  	select HAVE_KERNEL_BZIP2
 +	select HAVE_KERNEL_GZIP
 +	select HAVE_KERNEL_LZ4
  	select HAVE_KERNEL_LZMA
 -	select HAVE_KERNEL_XZ
  	select HAVE_KERNEL_LZO
 -	select HAVE_KERNEL_LZ4
 -	select HAVE_HW_BREAKPOINT
 +	select HAVE_KERNEL_XZ
 +	select HAVE_KPROBES
 +	select HAVE_KPROBES_ON_FTRACE
 +	select HAVE_KRETPROBES
 +	select HAVE_KVM
 +	select HAVE_LIVEPATCH			if X86_64
 +	select HAVE_MEMBLOCK
 +	select HAVE_MEMBLOCK_NODE_MAP
  	select HAVE_MIXED_BREAKPOINTS_REGS
 -	select PERF_EVENTS
 +	select HAVE_OPROFILE
 +	select HAVE_OPTPROBES
 +	select HAVE_PCSPKR_PLATFORM
 +	select HAVE_PERF_EVENTS
  	select HAVE_PERF_EVENTS_NMI
  	select HAVE_PERF_REGS
  	select HAVE_PERF_USER_STACK_DUMP

--Sig_//MeX7p/BC111kDOgAdi1Zp7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb/ZmAAoJEMDTa8Ir7ZwVCiYQAIU8oI3cDn9VGS0En5nQ96zA
iHkuvdkduXceI4X4V+JnYHZYcLDLsiMFFJFe63osLyXU+vHV/Wluv7Y8CQczydwI
lPc7uKaFVoRhCf+stwZL1qmkvpJjuxE42LEN2ja2rXUXcy/qgEFATPEPM5GCs2rh
C2/nH2HWrnuK4zFF1R9J/UcawDDAGi6MST9KuXQp36LioYMbv2V04Y2hJIg0rdi+
euEV1hQ7YoyqR4+7QGXAcrMRYXrNIb/go885pyjzHni3n8ooIK3N1jvwrdzPX+db
Du5t9eR1FxTfSfPMl/KOid2MlaN1oN9KGlbkvh0G6bMCx6WBPW03xSecQuYorX4I
UXiI96JXRBPVK2SzwyYEDrajvky7SeFBlGcns4ZacRGdWd0n/vMP0/hJswEIv8BC
zFXvZTV8y8LiQsRIPrMf38z+M0w46nc4+5G88HFtsOx7pJSYS+kXM8/x5rFokU0e
I4yeu4ao5uiL3wyfauYOGRnVSEwBKRoJ3UX6O84IveAhq3hCWh7GU8i5Wu/pBfed
Y9iwaiOXSphQ+vqs4IgcJd+rQBwxrZB5olJzhtAAcVjkK9GHE0Wf4AodMrrmnx/s
0qw8RVUU7edxvfdkry+pBtb42hV56ElRU+N82OnONu0PAArEEJ2zMASm8/yAExEL
BGBovNz/iLWAABeGR59c
=aNWA
-----END PGP SIGNATURE-----

--Sig_//MeX7p/BC111kDOgAdi1Zp7--
