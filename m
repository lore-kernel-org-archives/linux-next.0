Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827933C192;
	Fri,  3 Jul 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082650; cv=none; b=ElWlkK/G1+3/B47DMSHFcagG9vgZjRcotpcU9zv+Q5Jr0x85RoCZ3OGHl2p2iq7mljr4bk7H/JZRZEJMiOiSw4PK5UNjM+cwtlYJoRjsZ1vn/3wg+1POzdtC5OpWGhUp1gs9GGzsVsEd3LUoFb5aqlSHbRURUs3U427BWixrVQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082650; c=relaxed/simple;
	bh=T9lRIDM0BC6rxE62YXju1670Pj/TtskaDWhPQMaX2Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPWpJysRBrZQ/UZnGe+QG0NxjKDQ67V92khdpbnjlMFLKP4hdSZj/xddpVkuu1yfsnmhquXMySN7HSNbOoYwZzOJzav7Wnt2QevjdsZ0ib9JpGdKt9ZTrw/gy11sMBfZjWTukW9TZE53XTSkNWjoNcbc/EdPi0qfkU8VHoCcaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=t1E5V960; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="t1E5V960"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783082646; x=1783687446; i=spasswolf@web.de;
	bh=WEtXfoqWT8u7TfvcGQ6O9maQtegVSFyhpY9XCAZTjiM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t1E5V960k9GWHyKAM2eGAlzP56GKeD+VWsMht0K7Q5ThXhL/HYwCpe4XnEI2MfcO
	 /Jl5iZjW7Iug/0xyvaVHupKS6pkHeojNUJUPzzQ6VqACo4HS8puZpp/UkYxK30qtj
	 5UoPDscsGU4KZchPD5R9vEUxt9RIFQefvRTqgDIbDok72DE/O6K9BrUnCn9hfJ3iD
	 FAsxesD0ps26ti+WutZLGv0fZLNXLlxPsFBzLcWPz/bJRfhu1oASdAXTv62ZOIS0Y
	 62tFslyU4+k0dJsnr7/zqTzOCge1saSplbbNmPBduvpEJwEe6z4zmBYdJdcQuEspa
	 kkMs+gSwEPbstGHI9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3GgY-1x5NJM36Bu-00sGpr; Fri, 03
 Jul 2026 14:44:06 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	Jesse Zhang <jesse.zhang@amd.com>,
	Amber Lin <Amber.Lin@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: GPU reset when running the ROCm hsa runtime tests on gfx12 and next-20260701
Date: Fri,  3 Jul 2026 14:44:03 +0200
Message-ID: <20260703124405.56248-1-spasswolf@web.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MdgM1gHWnnqABmfITQOcZ7/JkUOH9lnunASZUuddm4UxiLJQ6oy
 r3lxtEyOzXXzrAoEKv7KZ3Gt4Sz0k+tafN/SYhRLbIQrDzLZ0SITahGhtTRAdUArcO29vWA
 wTfoz137iu40xliEzwFmjiJDBvUdDiBBlQXklfaBIRogoRYStSbJLPen6LpaGY/Z9j63AjA
 E+rzQQY6zfCj8NVD+3F2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u/5JOxWitOA=;UqHqvgVAY8Mx1AUjKYT/HsCScix
 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

When running the ROCm hsa selftests on debian unstable (with ROCm packages=
 from experimental)
with linux next-20260701, the GPU will reset with the following error mess=
age:

$ /usr/libexec/rocm/libhsa-runtime64-tests/run-tests

[ T2548] amdgpu 0000:03:00.0: failed to suspend gangs from MES
[ T2548] amdgpu 0000:03:00.0: MES might be in unrecoverable state, issue a=
 GPU reset
[  T360] amdgpu 0000:03:00.0: GPU reset begin!. Source:  3
[T28252] amdgpu 0000:03:00.0: Failed to evict queue 0
[T28252] amdgpu: Failed to quiesce KFD
[  T360] amdgpu 0000:03:00.0: Dumping IP State
[  T360] amdgpu 0000:03:00.0: Dumping IP State Completed
[  T360] amdgpu 0000:03:00.0: MODE1 reset
[  T360] amdgpu 0000:03:00.0: GPU mode1 reset
[  T360] amdgpu 0000:03:00.0: GPU smu mode1 reset
[  T360] amdgpu 0000:03:00.0: GPU reset succeeded, trying to resume
[drm] PCIE GART of 512M enabled (table at 0x00000083DAB00000).
[drm] AMDGPU device coredump file has been created
[drm] Check your /sys/class/drm/card0/device/devcoredump/data
[  T360] amdgpu 0000:03:00.0: VRAM is lost due to GPU reset!
[  T360] amdgpu 0000:03:00.0: PSP is resuming...
[  T360] amdgpu 0000:03:00.0: RAS: optional ras ta ucode is not available
[  T360] amdgpu 0000:03:00.0: RAP: optional rap ta ucode is not available
[  T360] amdgpu 0000:03:00.0: SECUREDISPLAY: optional securedisplay ta uco=
de is not available
[  T360] amdgpu 0000:03:00.0: SMU is resuming...
[  T360] amdgpu 0000:03:00.0: SMU is resumed successfully!
[  T360] amdgpu 0000:03:00.0: program CP_MES_CNTL : 0x4000000
[  T360] amdgpu 0000:03:00.0: program CP_MES_CNTL : 0xc000000
[drm] DMUB hardware initialized: version=3D0x00010300
[  T360] amdgpu 0000:03:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[  T360] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[  T360] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[  T360] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[  T360] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[  T360] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 9 on hub 0
[  T360] amdgpu 0000:03:00.0: ring sdma1 uses VM inv eng 10 on hub 0
[  T360] amdgpu 0000:03:00.0: ring vcn_unified_0 uses VM inv eng 0 on hub =
8
[  T360] amdgpu 0000:03:00.0: ring jpeg_dec uses VM inv eng 1 on hub 8
[  T360] amdgpu 0000:03:00.0: GPU reset(1) succeeded!
[drm] device wedged, but no recovery needed
[ T2050] amdgpu 0000:03:00.0: VM memory stats for proc xfwm4(2105) task xf=
wm4:cs0(2050) is non-zero when fini
[ T1932] amdgpu 0000:03:00.0: VM memory stats for proc (0) task (0) is non=
-zero when fini
[ T2293] amdgpu 0000:03:00.0: VM memory stats for proc (0) task (0) is non=
-zero when fini
[ T1929] amdgpu 0000:03:00.0: VM memory stats for proc (0) task (0) is non=
-zero when fini
[ T1930] amdgpu 0000:03:00.0: VM memory stats for proc (0) task (0) is non=
-zero when fini
[ T2263] amdgpu 0000:03:00.0: VM memory stats for proc firefox-esr(3483) t=
ask firefox-es:cs0(2263) is non-zero when fini
[ T3590] amdgpu 0000:03:00.0: VM memory stats for proc RDD Process(4755) t=
ask firefox-es:cs0(3590) is non-zero when fini
[ T1469] amdgpu 0000:03:00.0: VM memory stats for proc Xorg(1495) task Xor=
g:cs0(1469) is non-zero when fini


As this does not occur on v7.2-rc1 I bisected the issue and found
commit f94bbd648bb4 ("drm/amdgpu: use a single entry point for mes compute=
 reset")
as responsible.
Unfortunately the does not revert cleanly in linux-next-20260701, so I had=
 to revert these
commits to fix the issue in next-20260701:

b789664e3e30 ("drm/amdkfd: Clean up suspend_all and resume_all mes")
a665d09b10af ("drm/amdkfd: Pass known bad queue info to reset")
a4e4d945cba8 ("drm/amdgpu/gfx: defer per-queue helper_end until after MES =
resume")
f401a2633e02 ("drm/amdgpu: Remove faulty queue before resume")
f94bbd648bb4 ("drm/amdgpu: use a single entry point for mes compute reset"=
)

GPU used:
03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AM=
D/ATI] Navi 44 [Radeon RX 9060 XT] [1002:7590] (rev c0)
CPU used:
model name	: AMD Ryzen 9 9950X 16-Core Processor

Installed ROCm packages (from debian experimental)

bert@homer:~$ dpkg -l | grep 7.2.4
ii  hip-utils                                                        7.2.4=
-1~exp1                             amd64        utilities for HIP languag=
e development
ii  hipcc                                                            7.2.4=
+dfsg-1~exp1                        amd64        C++ Runtime API and Kerne=
l Language for AMD and NVIDIA GPUs
ii  libamd-comgr-dev                                                 7.2.4=
+dfsg-1~exp1                        amd64        ROCm code object manager =
- development package
ii  libamd-comgr3:amd64                                              7.2.4=
+dfsg-1~exp1                        amd64        ROCm code object manager
ii  libamdhip64-7:amd64                                              7.2.4=
-1~exp1                             amd64        HIP runtime for AMD GPUs =
- library
ii  libamdhip64-dev                                                  7.2.4=
-1~exp1                             amd64        HIP runtime for AMD GPUs =
- headers
ii  libhiprtc-builtins7:amd64                                        7.2.4=
-1~exp1                             amd64        HIP runtime compilation l=
ibrary - builtins
ii  libhiprtc7:amd64                                                 7.2.4=
-1~exp1                             amd64        HIP runtime compilation l=
ibrary
ii  libhsa-runtime-dev:amd64                                         7.2.4=
+dfsg-1~exp1                        amd64        HSA Runtime API and runti=
me for ROCm - development files
ii  libhsa-runtime64-1:amd64                                         7.2.4=
+dfsg-1~exp1                        amd64        HSA Runtime API and runti=
me for ROCm
ii  libhsa-runtime64-tests                                           7.2.4=
+dfsg-1~exp1                        amd64        HSA Runtime test suites f=
or ROCm
ii  librocblas-dev                                                   7.2.4=
-1~exp1                             amd64        ROCm library for basic li=
near algebra - headers
ii  librocblas-doc                                                   7.2.4=
-1~exp1                             all          ROCm library for basic li=
near algebra - documentation
ii  librocblas5                                                      7.2.4=
-1~exp1                             amd64        ROCm library for basic li=
near algebra - library
ii  librocblas5-bench                                                7.2.4=
-1~exp1                             amd64        ROCm library for basic li=
near algebra - benchmarks
ii  librocblas5-tests                                                7.2.4=
-1~exp1                             amd64        ROCm library for basic li=
near algebra - tests
ii  librocblas5-tests-data                                           7.2.4=
-1~exp1                             all          ROCm library for basic li=
near algebra - test data
ii  librocm-core-dev                                                 7.2.4=
-1~exp1                             amd64        provides methods to get i=
nformation about installed ROCm - headers
ii  librocm-core1                                                    7.2.4=
-1~exp1                             amd64        provides methods to get i=
nformation about installed ROCm
ii  librocm-smi64-7                                                  7.2.4=
-1~exp1                             amd64        ROCm System Management In=
terface (ROCm SMI) library
ii  librocsolver-dev                                                 7.2.4=
-1~exp1                             amd64        ROCm library for numerica=
l linear algebra - headers
ii  librocsolver0                                                    7.2.4=
-1~exp1                             amd64        ROCm library for numerica=
l linear algebra - library
ii  librocsolver0-tests                                              7.2.4=
-1~exp1                             amd64        ROCm library for numerica=
l linear algebra - tests
ii  libroctx64-4                                                     7.2.4=
-1~exp1                             amd64        ROCm library for profiler=
 annotations - library
ii  rocm-device-libs-22                                              7.2.4=
+dfsg-1~exp1                        amd64        AMD specific device-side =
language runtime libraries
ii  rocm-opencl-icd:amd64                                            7.2.4=
-1~exp1                             amd64        AMD ROCm implementation o=
f the OpenCL API - ICD runtime
ii  rocminfo                                                         7.2.4=
-1~exp1                             amd64        ROCm Application for Repo=
rting System Info


Bert Karwatzki
   =20
