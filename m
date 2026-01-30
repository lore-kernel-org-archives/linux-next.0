Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628961EB9E1
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740220; cv=none; b=RFQZWPYXoz3YvUTOR1I+9SW8aGs7Tz5tBBbl6tn5iUXcUtrKkYJraCWyzV28q8KjDEa3XZJgpQ3s/K2A9KtvDFDeAaghEWtFZD/RvSewk1pzi//cQJJcJR05q1FsX+xQDKuKj8DNlBhXzejGn8CndJbwcuw9lwu8dwpizVWWWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740220; c=relaxed/simple;
	bh=Ui+5kdsJzkfYHkbXuPmGAxv+swGN56ahzmNzh/NoS3s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=njaC1YkLU3ffQ8Q0IeCdkNvtduLTtxwF24hTBQ5MesCl3+y8IYFzssUlujOO0ipCGIOiq31giaY3gTTWLYFd+pQD+rDM3kXfUpyG0GLn3fZN0162sHsHHrVHbu+LTB1aXfSvYEoqtQxCWtfKiZ7dvuWX0VZcmoJxNpuaScbVIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eEVsaGlJ; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eEVsaGlJ"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b720bb90d0so1730406eec.0
        for <linux-next@vger.kernel.org>; Thu, 29 Jan 2026 18:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769740217; x=1770345017; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5ZOMTb3BdL+afgr4puEorEdqsNQz5KH836KM8cJw2Q=;
        b=eEVsaGlJ3OwkSH38WIQppLhFL2QL8GFu5wxB54rU5AW/MK/xeRj7BcnK33y4DYBvTr
         AlT4dRfggteT3kkHiqxQDw79UaYIdwbXzgc7xnFl1Z0Q727yEXbKTIyMKxvQa5I3LDxZ
         QsqtF+eQCL1nikm5LtfF3nis/ANVwQ3KeL5+wXQDfL5jaur3NBszV/3+qlIaUS0S3OjK
         pf4HG+Fs03PHzSXDLq1qY7v+NVjRoyj7ETJJNo9hyha7DvdCvrnYe/nUBCnm2CMbh1DV
         jEP/5MiaMdsAv6zA7Zy2PWdn2Y4Ufl2J41m1C+rzgcRknOMAePETTv2ny8jVNn5mF4Hg
         s+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740217; x=1770345017;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5ZOMTb3BdL+afgr4puEorEdqsNQz5KH836KM8cJw2Q=;
        b=JmufTbX1lL78d8fgzF61I8w+KAhAHlzWVdHuJw2M32CHNR+4kbmT4NH1tcVFfNUBIK
         V4AQnGUDZzkQYKpX5xb8OuyTjTJDChq13Kogf3Swm1y5BJCwwJ0XRl2SO+rMtVN+4Gay
         ZEokg43m/83KvPvTa2XqqHJGmJOUMro0WtRmKGGGe10xTHhLjzMOq+E27v2dcJ64hfOp
         z2f2SnsZVzxwmTUF8VBYrOlWkdmH9oXQsLms6dkEPra02BquiDUEyUIFvTt8yV7Zw1XM
         U/fI/pTIZ7EpjQgYLCF79YRI5wwrLtcsPhe8sVL8jr4o383eSZ0eoLnfYZHqk7lqT1Su
         V86g==
X-Gm-Message-State: AOJu0Yy8TyyEUkNJZy8cg3wk7XjaJOGzgfXdx1uR95Al6T+4jkWiskvN
	GalC/w1fWRqoygEJWwiVqFRw5QVeDZAcaUUjE1KMTtBs1egGnQ7mu9k46VINwOi79e+xS4STrfG
	5BvwCd2LXBQ==
X-Gm-Gg: AZuq6aIITxxDjjZ0evYy/eODUHuUTd9GWeNK9joIsi2ez8A5mQ6to+907PSFHKtsLIH
	hdR0Kmy+cLftRrgE7I8FvJNRJk1uwoC52cwDUYTZrasaRL3i8AZ9AUV8RjCd5ja0U2WWqqTONUQ
	X3u9EXgpjFW04zMMA4E+0DITDiSrba3QdljNkmAxthN6QMVZ/zcMpLsXigZN6XE8pc8dPhWh2XV
	4yhldY9gmzsqeUfl3Riapub9zzFzv6R8u5QJ1lpvTmrNgyQAjS+ubgr/l8oz+x5koFGLHRCNENm
	kPAyPkn1fzZsQIKiEeY7qvu9n5V7qr51TuZazqy1UF2rxyhhYMSdGuIdSn0ler/rNCeO8cGMS6q
	pjJ1o8bpZf4uP1vtF4/DXA2ohcrs8ME9PfsrTjuUP44dOBTt06GC1Gu8QujNdrKTEG5ww8FYO2A
	Qk0617Hw3rcYq7e1Q=
X-Received: by 2002:a05:693c:3004:b0:2b7:3424:d42b with SMTP id 5a478bee46e88-2b7c89098d5mr736619eec.37.1769740214172;
        Thu, 29 Jan 2026 18:30:14 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe714sm9326082eec.20.2026.01.29.18.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:30:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 33a647c659ffa5bdb94abc345c8c86768ff96215
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 30 Jan 2026 02:30:13 -0000
Message-ID: <176974021317.4377.5043497144717999621@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/33a647c659ffa5bdb94abc345c8c86768ff96215/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 33a647c659ffa5bdb94abc345c8c86768ff96215
origin: maestro
test start time: 2026-01-29 17:18:48.982000+00:00

Builds:	   48 ✅    7 ❌    0 ⚠️
Boots: 	  158 ✅    3 ❌    0 ⚠️
Tests: 	11939 ✅ 1526 ❌ 4662 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697baf8ba1ae387ffbb5e29a
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:697bab5f1908a6300d9d8887
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:697babcba1ae387ffbb5b79b
      history:  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:697bab621908a6300d9d8896
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.clone3.clone3_clone3
      last run: https://d.kernelci.org/test/maestro:697b9fd41908a6300d9d4dd1
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.clone3.clone3_clone3_clone3_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:697b9fd41908a6300d9d4de3
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.clone3.clone3_clone3_CLONE_ARGS_SIZE_VER0_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:697b9fd41908a6300d9d4dd7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.clone3.clone3_clone3_sizeof_struct_clone_args_8_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:697b9fd41908a6300d9d4dd5
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-loadavg-001
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6726
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-net-dev-lseek
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6724
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d670b
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_fsconfig_fd
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d670f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_fsconfig_string_path
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6710
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_mount_string_path
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6711
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_reconfigure_fsconfig_fd
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d670c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_reconfigure_fsconfig_string_path
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d670d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-pidns_ns_pidns_reconfigure_remount
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d670e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_setns-dcache
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6716
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_setns-sysvipc
      last run: https://d.kernelci.org/test/maestro:697ba3811908a6300d9d6715
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:697b9ea11908a6300d9d486c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.mesgq_nstest_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d7b
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.msg_comm
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d79
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns04
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d73
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns05
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d72
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns06
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d71
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns10
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d70
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns13
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d6e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns16
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d6d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns17
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d6c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pidns32
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d68
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sem_comm
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d43
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sem_nstest_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d48
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.semtest_2ns_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d45
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.shm_comm
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d7d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.shmem_2nstest_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d7f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.shmnstest_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d77
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.utsname03_clone
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d40
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.utsname03_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d3f
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:697bb178a1ae387ffbb5f0d5
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.clone3.clone3_clone3_New_time_NS
      last run: https://d.kernelci.org/test/maestro:697b9fd41908a6300d9d4dd3
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.mesgq_nstest_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d7a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.sem_nstest_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d47
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.semtest_2ns_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d44
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.shmem_2nstest_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d7e
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.shmnstest_unshare
      last run: https://d.kernelci.org/test/maestro:697ba4ba1908a6300d9d6d81
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:697ba2aa1908a6300d9d629a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697bafcda1ae387ffbb5e3d2
      history:  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.SL1_SVA_B
      last run: https://d.kernelci.org/test/maestro:697baf81a1ae387ffbb5e16e
      history:  > ✅  > ❌  > ✅  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
