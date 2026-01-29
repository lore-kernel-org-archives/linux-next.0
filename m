Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC83191C0
	for <linux-next@vger.kernel.org>; Thu, 29 Jan 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653819; cv=none; b=XEtVxsytMnZYCQ/+8J84wpAqKhGLI+pLl4YUTcOwB3QHsDv+pvuY71I8uvKQz3FRasxIXhFI9z3pVnAyQUAv/JQj9SAuZtq1LSbPjb7KWNHEZ4uSH9RycJ3rod3fBZbTHf6a5XPQeVxXzBArfuaxakb13DmHKpRc5YRuJkWCU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653819; c=relaxed/simple;
	bh=OZgCNyiMtoQbHVMr2Bq4tHh/53TwXJwDu57OBEwl97c=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=LVQVopC9Jz57+kWaxh6ObPMVVYBpiKog++bkSnP7CRJeCxKWiIORyqb01GDg4JCrJJ2kwyW7A0UQAUcNRL3oc6eSC5r8VuB4DYztNaHFrmJq6SHcJ70nQkswpnBPmgM+pG+N73DzZcJwRDC4xzZVl4N1J1+KaeMhmf2pFfTVx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TSTiRMAq; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TSTiRMAq"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b72e49776eso1008661eec.1
        for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 18:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769653817; x=1770258617; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB8bd1kdLCrxQG93uepw4PfjfGwFchPoV2GhOCIxyTM=;
        b=TSTiRMAqiFhazpriVb+uCAvK0tym+P5QpCOar0uTwK4oxzXCLtDJPCKi7d7mqzUnpe
         qoaZzVdSncG+PbPcBXXhs2Xhz02DU5mTMLqat5z9kFHFyfRMdVQLUVSVtHFlBZicFsYn
         d4wbIMioXZmwLl6Kt3xsBfSE6H0GELipZ4dMcEtm0XUlCBkOppY/vSsp8Znfo9hrJHFZ
         D6sGhhPfQfCqgxSxc/qzFnDhrRWNS0CElJRmzJGBYVmvyDQOEDXFAAOm699bkr3rC3qs
         lX+A5n969HrEydqyukvQN7OzMQPXpp8GzTzKhOGflUK9YLhPIXQOCW1yrRHculFNQ59E
         TLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653817; x=1770258617;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB8bd1kdLCrxQG93uepw4PfjfGwFchPoV2GhOCIxyTM=;
        b=ajCYDtzk3FF8umHuwQE0vQCS5hDFrgpIVIv6Xr/ey1ZDLLcsZvueQqP2QnVUoKv1eD
         ALBDNAiBqpWI5aVGYyW2TN89INF1Y8GH1aIc4m4zL6EJyTEKIJ0PyMf2jopZSKrs/ssP
         vyA140WPptLlHn/hoAEU/Xo94g1FJ8mAkBDKTYb6x7BGjh7dRKnXkaK+l74CWI/NNBKh
         u6HhX2+5CUkq56PDc8CF0+h5qNJIon6mzr5MNPyc6oE+DSbUFujIefACoRmeD9vvhRoB
         KN1PLaKNBGLtmzPDHcTcJWaJscVUVuj03VumqLFwaX0mWuVAxcYqgzrauhl8RyoUln4Z
         88Eg==
X-Gm-Message-State: AOJu0Yw+lGJEQ5QvIwXW1sa56QlnLPcM2i5x4ZApQQHVBnwcRjc6UUGN
	PoykfxaOu+qRvrqOwgS8mpbVBH1/sNwr5RvQxcSHN2M2mGphvBMABQq4/0t7gHUrrN4H4Le5XsK
	YXdr5+M4=
X-Gm-Gg: AZuq6aIzCmEppnLjGSbHhpc1oCALB1pJZxBnKWbeylByY7Ia1diF01bu97gjZpcRUFC
	mQ3egnZ69rPF73Tc3g8C0vEONvKTBVzQ/437POOZKS0GjcXv/uLC0JKy6yL+MkpAQNkvfNY5JWj
	RYrnd30nngQc94f+pR3twhFwl20aFCDkV9bkk9cSgzveFJg/sTmMGjo/Kb7dErVM5VzsPpAKtz4
	1QcQRxT5hmb8JZ0+ilb5ne+y7vV2ymyrbZ1sD9pmaMgJbbbH/0I6iO6o6x3np7L2lq9D8n79v+K
	hn7p7q8acus6O74v1URXHcI6RWVcOpe/I8I6Ox/okibPQenICEZBi2r5xyaf2deoObsFm4tPszc
	U5j7UEJo+VEdxBh4D3QKkxw5c1vy2C0sFYaIlgWqZLhKaWlo18UPBGIvENf+cqHK1EstMCTpAcP
	cGOdWJ
X-Received: by 2002:a05:7301:688c:b0:2b6:abdb:8cf5 with SMTP id 5a478bee46e88-2b78d903426mr4414657eec.14.1769653816786;
        Wed, 28 Jan 2026 18:30:16 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm5269635eec.26.2026.01.28.18.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:30:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3f24e4edcd1b8981c6b448ea2680726dedd87279
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 29 Jan 2026 02:30:16 -0000
Message-ID: <176965381570.3916.1427202098696861632@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3f24e4edcd1b8981c6b448ea2680726dedd87279/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3f24e4edcd1b8981c6b448ea2680726dedd87279
origin: maestro
test start time: 2026-01-28 17:14:13.979000+00:00

Builds:	   48 ✅    7 ❌    0 ⚠️
Boots: 	  110 ✅    2 ❌    0 ⚠️
Tests: 	 5069 ✅  359 ❌ 1945 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:697a58b01908a6300d9c3bfa
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:697a5c5e1908a6300d9c4dd5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:697a886a1908a6300d9cbf67
      history:  > ✅  > ⚠️  > ✅  > ✅  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
