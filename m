Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4C7369D51
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602053; cv=none; b=czGSmOT/P1mRXdwCir4nO8DhXg0fhW8+OQ+wqJ0SY7anxM2y2eVrgGzyQvgnm9TZC2AWbrLHMalDrvig/sdretiy06q70AJdNlAl8zOoAvlheFPgSIHliDZASP5DLaCKU0phNx6wX/oQCNRiE78BM4pJKwIfbU4bVbgiBz86tmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602053; c=relaxed/simple;
	bh=+E4sr3ApYAx67ojdfuoIfGZdLzMgR7BzhkRi3joo42E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LXk0b7qh9ZXko54dbGWwWUADHNmBd8f3G73eRXOp1mcECBOfcTRdZHE4utj21BOmbFvpYFZVV4Lx5azHrafmSt5W+pQ4FI2D7ppfd3ajYFLI+CLn9r3GTJAH7zrrIGTK5Xl/tInSc0VBhyTZzlJ2CT9kdgGDGP+C7q1VINPSYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXUnv+/d; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXUnv+/d"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so3162315e9.1
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786602049; x=1787206849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIkogX0nsWcChibFiyEXOsML18t7FCRxTFSNVsFKCxc=;
        b=iXUnv+/dJcleU3ffidMuB2hUWAtz2dp74VXFyTGyHhcSGYGQHuqAs8kXlQBIddpzBa
         C0R3G/Cu0ukmWl05F+Xv1cws4ty2iHlE1X5rWCL/ZdpkRXEuAliXdEA8CV41wR4ekloP
         JOzBocarRKClPrxV5+DsaEBzWBmt1Lz8sOwtEk45T/8LDU2c1wzR9kx9Cmv90NrDU4v9
         +3gi+j50Uxo/Yi0SkKQwLcjk+AWkiisZW04sard9+BONx4tILwVR+WZX/Zn/JtdqqDdG
         Cwc8H98pEWvzKUUlgojqHahpdp6ZdNHgX4ESGwcRzA7Tdk+odK4aVzmOCRudJUiH4GHK
         mgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602049; x=1787206849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIkogX0nsWcChibFiyEXOsML18t7FCRxTFSNVsFKCxc=;
        b=Q64dn8uQkdVpoCbfZXk7NKkfzEnhR8n1cUsSRsa3lNpKZPx9cEu/in1A2Fg/cnoTxB
         PWgjA0iROUC538xXCqyXwGfzrovEw+hfSjNh8uaewwxru5/jdDtXKD2q2oesLVvtrWVc
         c/nPSGMan7MGXC6sM+WNj3pMolD4a70S5HOYk/59WHuGogBWgpWHTAJORKK4svvAKhTU
         cy0F3uFOuvwGcVpBDwe817XP7rX+n4lPecforIwRYpGNntbG51R+thrWOQCI+acwvOtf
         cZFiWXOMghihg2iZNeFynoHbwCzF6WKt7GNzoVWgfS3nkxAChrKxwwz7rSpNB1CQP88+
         5AOw==
X-Forwarded-Encrypted: i=1; AHgh+RpaIY/v95DFeV/KZSySIovSFF0gL19uZs4bFcsMpwkET7D82UPQ3HcWLuavHtVxAEAZweBLj90T8HR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+S8YWvGDnzzl0p9GiPv8CHid7muEwuvaMSW2OovKKdgLYFggX
	uowgWnsn5gu5oCReOZ92o0OhO/CHsMHnM6Exxg6GiEsmX3oWt/3qdCiy
X-Gm-Gg: AR+sD13y6hBanH0MDyOyiVN0TUSfU/FNUIkGW4AyufjfSXxSqRCiVfftL3K8bJI6UuX
	QqrLPF3SYegYDX1tWzfpn1dsYLf9I0JgeodwCbtW+WBe+xyl95ib92/5mdFU3+TdDNhmo+Ew5XD
	GPnuUMxXL2eh5btr7tiDOXlDGJGIH5qf1Py87wLzm/qYvWzR+Up15eqQdfbDz0/kPR0mUZqCSbp
	eQFAexD5hwOWUQrpEgsLbp0phHUCAjuPUwe/W5if7vuUNhS/DP9e7Yd/gTxVamRoVkwdKSwvmdD
	Q84b32RK/RwfHQ/BJ+Hn8BuzpKSIYLzIMJyelpAL8rTd8sAKI/lndrmv/n94rFvrnHhQ+707nbj
	70IHHPWKVvmBwHTCYqR0J+U1kinhAYKWKDPjnyCV+6iZ98a9tcK/BjhDDb8JByGqdkbfAe5SXTR
	Nz8Opd3jIBnJMrMk0zpDopmpX6QP7QRExWpE2SPP+eXhbuKCsj4b7y+XmeU4h56Kh22QgTkla3t
	wlpIOr1k4jDtNZ8rppDHqwfujsXfHZs5zX/5Mrw2szcm9nKx65Gr4C+UCL7PlXgwMjuNHhRdaBq
	TzrvNHYlCqCMd9tqgXTNST61yIgXeDgjulQAwY4EA+BFy7dBY8WTCrqLLHGCrBSpuVO7w/w2Og=
	=
X-Received: by 2002:a05:600c:a4b:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-499821f2e1bmr32499355e9.15.1786602048980;
        Wed, 12 Aug 2026 23:20:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c79-1f01-1565-573d-10dc-99f9.310.pool.telefonica.de. [2a02:3100:9c79:1f01:1565:573d:10dc:99f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b0f4afsm47001025e9.5.2026.08.12.23.20.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 23:20:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gregory Price <gourry@gourry.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Date: Thu, 13 Aug 2026 08:20:39 +0200
Message-Id: <20260813062039.14567-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysctl-next removes CONFIG_PROC_SYSCTL because it mirrors CONFIG_SYSCTL.
When combined with the syscall user dispatch sysctl in linux-next, the
stale guard prevents registration of kernel.syscall_user_dispatch.

syscall_user_dispatch_allowed defaults to true. SUD therefore remains
available, but administrators cannot disable new activations.

Use CONFIG_SYSCTL for the guard and documentation.

Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_dispatch sysctl")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The conflicting sysctl-next commit is currently:

  8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")

This is a cross-tree integration fix intended for the tip tree. It has
no functional effect in tip/master, but restores the sysctl when
combined with sysctl-next.

Verified in linux-next with an x86_64 object build using
CONFIG_SYSCALL_USER_DISPATCH=y and CONFIG_SYSCTL=y.

 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 kernel/entry/syscall_user_dispatch.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e9..ffea61d448ebb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dispatch via
   ==  ===================================================================
 
 Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``
-and ``CONFIG_PROC_SYSCTL``.
+and ``CONFIG_SYSCTL``.
 
 
 sysctl_writes_strict
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 2002c7aae4358..59c861866941d 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 					      (char __user *)(uintptr_t)cfg.selector);
 }
 
-#ifdef CONFIG_PROC_SYSCTL
+#ifdef CONFIG_SYSCTL
 static const struct ctl_table syscall_user_dispatch_sysctls[] = {
 	{
 		.procname	= "syscall_user_dispatch",
@@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(void)
 	return 0;
 }
 late_initcall(syscall_user_dispatch_sysctl_init);
-#endif /* CONFIG_PROC_SYSCTL */
+#endif /* CONFIG_SYSCTL */

base-commit: 98292902c7108717c4f4bea7226520b336f9a8bc
-- 
2.53.0
