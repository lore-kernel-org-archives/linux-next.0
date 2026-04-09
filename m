Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FA13D566C;
	Thu,  9 Apr 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740480; cv=none; b=pWQJrN+C49kWKXeta0W+8TPXAjn3Etzikg0QFRwXtkt24AvWtXNbyR9dcZm8RjdkZEHWrG7FUiQr5zQ7EronoV6GsrY9QUffQxFGw11Ia8iIgpItpxAc/1yjRF3wWT2U18JY49y3Yke44fqaEWml1RF9w5WHvmgAW7BVnjKJQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740480; c=relaxed/simple;
	bh=K5f3eOgbEJnuep20c7QPzcSdfq3tHpa42+VJmCLaaK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhykrYuTsHPvcvGT40Z/aKFuYCsUguNHuylALsYAZRwAUQ3IisbyYjgEUcZv4wCfxaGcTTRWFf6dYNogO0lddndCqWNQG4iWUk2iKtYrNC+/4UA2tu/+ETSvDRiQaukoRZQuomr3N5oHc/BV5IYnN9gp6GjAthmqHBi/3asvHaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=LVZ9ax37; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="LVZ9ax37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1775740453; x=1776345253; i=spasswolf@web.de;
	bh=6b2l+CZDNg2pxI1O9oh0F6gJWUNI4pMAKls5VQTm8KY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LVZ9ax37YxGj9ifHOAIMr77CGzHqo7oZnZvq3+lk9RhcOfR7AFergFl43wnBMT8x
	 ugCU75myUX2MSFVf7MhU3rNLJFuYLfW/w965mpA7EA/duZu8Vu8TIdagLZs9xkamG
	 Pmp0YUxawUJSUrPl7DYBsnoTzylwlTlsSpAIBHRrcoPt7UetbnrYRu/Pf+rTFJNy0
	 HA35bX4MKET8zY6tB0oGNz2KC1tNm4wJ+dVWYUwWq1/5lTNXjH4U0S0QeGpW6+TVg
	 elF4j7Ia0V/hGbPxcZKPmRc4XKzReUpYoSXw0iGSMWfjXgwWB9FRxtZw7+Uhh9Cl4
	 /okiJXKjw+fhbGJSmQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsaW1-1vLLJv3wOh-014cGq; Thu, 09
 Apr 2026 15:14:13 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Rafal Ostrowski <rafal.ostrowski@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Dillon Varone <dillon.varone@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	amd-gfx@lists.freedesktop.org
Subject: kernel panic when resuming from hibernate in next-20260406 with PREEMPT_RT
Date: Thu,  9 Apr 2026 15:14:10 +0200
Message-ID: <20260409131411.10598-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YYzBKjPwlUxWETH4D6FNCZqwJnwAMbgoUlrR0b1nRZGsngVlVMm
 M098039BdeWRqVkP1JKo6ouYV/nt6tK5/W8pw76W4+5zO36y58snRydX8RrmXXa9JLi/s5A
 RyvbbatUf1/MfpVG7HV/yBtxT3rtgInIEqAmtam6KJl1dPL3mpadZKVpe2/cQ80RjUMKy6I
 JYfneMQV+Z3+L8mUb0E8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XCAQIhTMUDI=;lzZ/gj7TaTfB1doFf6VdCIkZGFY
 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
 OY

I noticed that my debian stable (trixie) system running linux next-20260406
would sometimes hang when resuming from hibernate (I also had two similar e=
rrors
under different circumstances, one just after booting and one when starting=
 the
game stellaris, but hibernate seems to be the best way to provoke this erro=
r).=20
There are usually no error messages, but once I got this (incomplete) error=
 (via drm panic "kmsg"):

[ 51.556812][ C0]  gpio_amdpt gpio_generic
[ 51.556817][ C0] ---[ end trace 0000000000000000 ]--- (the start tag is no=
t present in the qr_code)
[ 52.616208][ C0] RIP: 0010:__get_vm_area_node+0x140/0x150
[ 52.616214][ C0] Code: 00 00 ff c5 39 c5 0f 4c e8 b8 1e 00 00 00 39 c5 0f =
4f e8 c4 e2 d1 f7 ea e9 3e ff ff ff 4c 89 e7 e8 35 48 01 00 45 31 e4 eb b0 =
<0f> 0b 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 40 d6 41 50
[ 52.616215][ C0] RSP: 0010:ffffae404dcc3818 EFLAGS: 00010206
[ 52.616217][ C0] RAX: 0000000000ff0000 RBX: 000000000000000c RCX: 00000000=
00000022
[ 52.616217][ C0] RDX: 0000000000ff0000 RSI: 0000000000000001 RDI: 00000000=
0000f720
[ 52.616218][ C0] RBP: 000000000000000c R08: ffffae4040000000 R09: ffffce40=
3fffffff
[ 52.616218][ C0] R10: ffffce403fffffff R11: 0000000000000006 R12: ffff9f28=
9d400000
[ 52.616219][ C0] R13: ffff9f289d6e9fd0 R14: 0000000000000dc0 R15: 00000000=
0000f720
[ 52.616220][ C0] FS:  00007f814cdc9b40(0000) GS:ffff9f383a215000(0000) knl=
GS:0000000000000000
[ 52.616220][ C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000000050033
[ 52.616221][ C0] CR2: 00007f8134000020 CR3: 0000000201867000 CR4: 00000000=
00f50ef0
[ 52.616221][ C0] PKRU: 55555554
[ 52.616222][ C0] Kernel panic - not syncing: Fatal exception in interrupt
[ 52.616302][ C0] Kenrel Offset: 0xc00000 from 0xffffffff81000000 (relocati=
on range: 0xffffffff80000000-0xffffffffbfffffff)

I also got a really nice huge qrcode (via drm panic "qr_code") which showed=
 a little more of the message, but not
the beginning of the trace:

[ 125.266334][ C17] RSP: 002b:00007ffc1fcae230 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000010
[ 125.266335][ C17] RAX: ffffffffffffffda RBX: 000055845b640060 RCX: 00007f=
b699e8e91b
[ 125.266335][ C17] RDX: 00007ffc1fcae2d0 RSI: 00000000c05064a7 RDI: 000000=
000000000f
[ 125.266336][ C17] RBP: 00007ffc1fcae2d0 R08: 0000000000000060 R09: 000000=
0000000000
[ 125.266336][ C17] R10: 0000000000000003 R11: 0000000000000246 R12: 000000=
00c05064a7
[ 125.266336][ C17] R13: 000000000000000f R14: 00000000c05064a7 R15: 00007f=
fc1fcae2d0
[ 125.266337][ C17] &lt;/TASK&gt;
[ 125.266337][ C17] Modules linked in: ccm snd_usb_audio joydev snd_usbmidi=
_lib snd_ump snd_rawmidi snd_seq_dummy snd_hrtimer snd_seq snd_seq_device n=
ls_ascii nls_cp437 vfat fat mt7925e mt7925_common mt792x_lib mt76_connac_li=
b mt76 intel_rapl_msr snd_hda_codec_atihdmi mac80211 intel_rapl_common snd_=
hda_codec_hdmi iosf_mbi snd_hda_intel rapl snd_hda_codec wmi_bmof snd_hda_c=
ore spd5118 regmap_i2c snd_intel_dspcfg snd_hwdep snd_pcm libarc4 snd_timer=
 cfg80211 snd soundcore pcspkr rfkill ccp k10temp evdev nct6775 nct6775_cor=
e hwmon_vid configfs efi_pstore efivarfs autofs4 ext4 mbcache jbd2 hid_gene=
ric usbhid hid amdgpu drm_client_lib i2c_algo_bit drm_buddy drm_ttm_helper =
ttm drm_exec drm_suballoc_helper mfd_core drm_panel_backlight_quirks gpu_sc=
hed amdxcp drm_display_helper xhci_pci xhci_hcd drm_kms_helper ahci libahci=
 drm libata usbcore nvme scsi_mod igc nvme_core cec i2c_piix4 scsi_common v=
ideo usb_common nvme_keyring crc16 i2c_smbus nvme_auth wmi hkdf gpio_amdpt =
gpio_generic
[ 125.266351][ C17] ---[ end trace 0000000000000000 ]---
[ 126.356624][ C17] RIP: 0010:__get_vm_area_node+0x140/0x150
[ 126.356631][ C17] Code: 00 00 ff c5 39 c5 0f 4c e8 b8 1e 00 00 00 39 c5 0=
f 4f e8 c4 e2 d1 f7 ea e9 3e ff ff ff 4c 89 e7 e8 f5 49 01 00 45 31 e4 eb b=
0 &lt;0f&gt; 0b 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 40 d6 41 50
[ 126.356633][ C17] RSP: 0018:ffffb50f075275f8 EFLAGS: 00010206
[ 126.356635][ C17] RAX: 0000000000ff0000 RBX: 000000000000000c RCX: 000000=
0000000022
[ 126.356636][ C17] RDX: 0000000000ff0000 RSI: 0000000000000001 RDI: 000000=
000000f720
[ 126.356637][ C17] RBP: 000000000000000c R08: ffffb50f00000000 R09: ffffd5=
0effffffff
[ 126.356637][ C17] R10: ffffd50effffffff R11: 0000000000000006 R12: ffff90=
90a6000000
[ 126.356638][ C17] R13: ffff9090a62e9fd0 R14: 000000000000f720 R15: 000000=
0000000dc0
[ 126.356639][ C17] FS: 00007fb699b0eb40(0000) GS:ffff90a00a848000(0000) kn=
lGS:0000000000000000
[ 126.356640][ C17] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 126.356640][ C17] CR2: 00007f617c3fa02f CR3: 00000001a0c4e000 CR4: 000000=
0000f50ef0
[ 126.356641][ C17] PKRU: 55555554
[ 126.356642][ C17] Kernel panic - not syncing: Fatal exception in interrupt
[ 126.356811][ C17] Kernel Offset: 0x30a00000 from 0xffffffff81000000 (relo=
cation range: 0xffffffff80000000-0xffffffffbfffffff)

Hardware used:
$ lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge IOM=
MU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridg=
e GPP Bridge
00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridg=
e GPP Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridg=
e GPP Bridge
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridg=
e Internal GPP Bridge to Bus [C:A]
00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridg=
e Internal GPP Bridge to Bus [C:A]
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 71)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Data Fabric; Function 7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam Port of PCI Express Switch (rev 25)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downs=
tream Port of PCI Express Switch (rev 25)
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi 44 [RX 9060 XT] (rev c0)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 48 HDMI/D=
P Audio Controller
04:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD=
 9100 PRO [PM9E1]
05:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Upstream Port (rev 01)
06:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
06:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
06:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
06:08.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
06:0c.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
06:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset P=
CIe Switch Downstream Port (rev 01)
08:00.0 Ethernet controller: Intel Corporation Ethernet Controller I226-V (=
rev 06)
09:00.0 Network controller: MEDIATEK Corp. Device 7925
0b:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 800 Series Chips=
et USB 3.x XHCI Controller (rev 01)
0c:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] 600 Series Chip=
set SATA Controller (rev 01)
0d:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. =
[AMD] Raphael/Granite Ridge PCIe Dummy Function (rev c1)
0d:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 19=
h PSP/CCP
0d:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite =
Ridge USB 3.1 xHCI
0d:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite =
Ridge USB 3.1 xHCI
0e:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite =
Ridge USB 2.0 xHCI

$ cat /proc/cpuinfo=20
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 26
model		: 68
model name	: AMD Ryzen 9 9950X 16-Core Processor
stepping	: 0
microcode	: 0xb404035
cpu MHz		: 624.194
cache size	: 1024 KB
physical id	: 0
siblings	: 32
core id		: 0
cpu cores	: 16
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 16
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtsc=
p lm constant_tsc rep_good amd_lbr_v2 nopl xtopology nonstop_tsc cpuid extd=
_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 =
movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_l=
egacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext p=
erfctr_core perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_=
l3 hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall fsgs=
base tsc_adjust bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq=
 rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw avx512=
vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_m=
bm_local user_shstk avx_vnni avx512_bf16 clzero irperf xsaveerptr rdpru wbn=
oinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasi=
d decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif x2avic v_=
spec_ctrl vnmi avx512vbmi umip pku ospke avx512_vbmi2 gfni vaes vpclmulqdq =
avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid bus_lock_detect movdiri mo=
vdir64b overflow_recov succor smca fsrm avx512_vp2intersect flush_l1d amd_l=
br_pmc_freeze
bugs		: sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass srso spectr=
e_v2_user vmscape
bogomips	: 8599.99
TLB size	: 192 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 48 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]

As the error does not occur in v7.0-rc7 I bisected the issue, declaring a c=
ommit as GOOD
when it passes 18 hibernate/resumes cycles (the issue is not 100% reproduci=
ble)

All these kernel are compiled with PREEMPT_RT:
7.0.0-rc7			     18 hibernate/resume cycles withot crash, GOOD
7.0.0-rc7-next-20260406-master	     crash on 1st resume, BAD
7.0.0-rc7-bisect-06060-g00f03539e3d9 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc7-bisect-09155-g9a6b64640388 crash on 1st resume, BAD
7.0.0-rc4-bisect-01504-g8e005ef09ba5 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc7-bisect-08350-gb82dff8ab846 crash on 4th resume, BAD
7.0.0-rc7-bisect-06517-ga03c0f5a4d5f 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc6-bisect-01673-gcdd65e8bb954 crash on 6th resume, BAD
7.0.0-rc4-bisect-00705-g02ade2557eba 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc4-bisect-01453-g353f20082505 crash on 8th resume, BAD
7.0.0-rc4-bisect-01428-g4c3aeb11d504 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc4-bisect-01440-g60c741a13fd1 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc4-bisect-01446-g32c1c35b6d8b crash on 12th resume, BAD
7.0.0-rc4-bisect-01443-g02c3060ee303 18 hibernate/resume cycles without cra=
sh, GOOD
7.0.0-rc4-bisect-01445-g4bb2f0721ed8 crash on 1st resume, BAD
7.0.0-rc4-bisect-01444-g3539437f354b crash on 3rd resume, BAD

The result of the bisection points to=20
commit 3539437f354b ("drm/amd/display: Move FPU Guards From DML To DC - Par=
t 1")
as the first bad commit.

As the offending commit contains preemption related macros I tried commit
3539437f354b ("drm/amd/display: Move FPU Guards From DML To DC - Part 1")
without PREEMPT_RT and got no error in 24 cycles:
7.0.0-rc4-nort-01444-g3539437f354b 24 hibernate/resume cycles without crash

Any Ideas?

Bert Karwatzki


