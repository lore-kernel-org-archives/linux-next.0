Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B80A35E953
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353594; cv=none; b=o3eTeNyq7VWReMrchu0f06K997618IeTScMY3ZydOqxPBVqR+rJRwWnkQqZGzUvLozjw4xqm442eAeO/Hk5fN4bu+X7fNkzPU5EJf6D2o0+2YN0Vytfj6XCxVV2W0TdX7qTwuJEFcIts2f1sQV/+EEdVLVrJJxyGuKJkRK1mOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353594; c=relaxed/simple;
	bh=bmcgmqSoIAG660NAk9RAaAgXzOjnzTzDFCbtRpPIEz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh2HcfCuaLq7CR+8oNO0fLOIoXZE6L4Dc+Un1c1iEWurTtOBGZiGtqGtW0O1FQDrSOoq30f9Nx9RfMDyCh7PM+/tzxorNuMfeHXhXAVfoBSjHUH3Oa7MEZScuog+RoJozP4pPnEfLqGYlWcewdwmCR5hMDP7Ymmu7ntf56sMwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6RdtQbr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6RdtQbr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e82c23840so47141045e9.3
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779353590; x=1779958390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLFMm/iBCeKuifSA9r1fgWxDtRtuFPgfT6+/MU5KPl4=;
        b=P6RdtQbrS+5V60HN94O/lXdQP0/yhZ2tfUp+fAcCa4lCf5hV5NRZYNVtQJ/wersks+
         v0bJiPt0mZSazADFErrZ2wOwgv/R/hKYSEwcn5TUkqstcrqkUZUCabHhIWlw7uN6aY6N
         18f+/p21iX+P4wDbCdmDVT1GZ27sIf+HV3IVSbiJL83grTYrdhCOGgKSH6TdRuJOsJRh
         KBs4PXD/vyEWh6yJfWFz3qx5MK+MZIXOMtDPH5jqgHOSTmgRnAnXo0EBykYUSO+T9BsL
         SFgB+QVRvJ3rBgrHi3GK3W4Cy63J/8ijaZWTGmXxTrEquqvQC7rSW5wA8SX0MhnlV+PX
         WXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353590; x=1779958390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLFMm/iBCeKuifSA9r1fgWxDtRtuFPgfT6+/MU5KPl4=;
        b=mK6WlfMZbtE5XLNCZ+1hIhDlnS/hvanxVhd9huzMxQfeJYKVbGIc8cOQfwsnuGBXAk
         iVHyp5X2pom+ds0GsVIb4FyAjXbFMggKME8FUesvtSKPLSs3NIUiiG1qSjDMJS6MqKV5
         lMLchxFhvmH9BOvmm8gQFd3X2YXn1n7SODEakMoKC7zsPN9dA9zxk1D1+h4tzBjTAFd9
         UhvD2B4D2IcM1qc0BacSVgmwGcFNgrrMciBIxXQz7Vk0XQhJaGCnNsexctNmtkRcdJVo
         cRHsx8hYdw/eqbayrgLmLTo977p98yS4ZC5adgC9+XzY22/pcXRODExYFQihtzf6m9Fe
         DUcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZowzvVxZeEINPV6U6lrrn2TyrrHQ5ISM2ewoc4ldopSEMFfTPxHF8K+QM7l1yqnK6mgBtZ0mxYspY@vger.kernel.org
X-Gm-Message-State: AOJu0YzMaaKvuWdIxQPI3HmmKqo7+Xi2ACtAKt8T66919ubdKWVXyWBb
	cGblg7WZgkXeH/kcnvL1oZ/vZsgVZbEEbS/XZCiSXcqPGngWU736zlTI
X-Gm-Gg: Acq92OHqYTDiywZuDW9fzFO2M8QsPa85cHV+u1RIy3NmbhP0cU3PFUaynYy02Lo8N9/
	f4vjMgbRzW5/uVHy5IPvFMorU3L/jcTZkeh00agJID5lriN2KA2C17tIOtYJ+21nQR3/q7Tm6fy
	MPQlaBI7JPVZCJgOFCK3Wyn6CPG58bgw6pX3H0Q/ZpvnT1zzz9SXqQjC6U6yhK83tryR8RQ6KBI
	JpV7M0eAXcRnB2RLYvDuL9R4RpreIngyNlVgTqVqsjyTo18q+1gNJN6yc0efR98VY7mKb+BR4HT
	b9YM8FtzrB/SB5jFBN+QN/5e/rKGtYxEKFRqP6uirRPtEQzjtDveY3uTqF/v8tX1nhQiav6VflN
	VDP0U6sooUzI4GiWWfOsiYDt8HWQLUzAE0SkEL6A8K3LNVF29EUf40LjTTXEkk3EGq+Pi9lcxmy
	106krSOHoLNW/wV5i0ZVgPO5I2OpQbTJIbCAOefzcmOj43OF7gp7F+6Npj5lSxyGGo2I9F5NM=
X-Received: by 2002:a05:600c:548e:b0:490:2238:4021 with SMTP id 5b1f17b1804b1-4903605ab10mr26339485e9.8.1779353590237;
        Thu, 21 May 2026 01:53:10 -0700 (PDT)
Received: from f (cst-prg-92-135.cust.vodafone.cz. [46.135.92.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035ef2d93sm14280335e9.9.2026.05.21.01.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:53:09 -0700 (PDT)
Date: Thu, 21 May 2026 10:53:03 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>, 
	Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
	viro@zeniv.linux.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
Message-ID: <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
References: <20260520225245.2962-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520225245.2962-1-spasswolf@web.de>

On Thu, May 21, 2026 at 12:52:44AM +0200, Bert Karwatzki wrote:
> Since version next-20260518 (with PREEMPT_RT) I noticed that my debian stable/trixie system
> would sometimes hang when booting displaying the following error message. After about ~1min
> booting continues to a rescue shell where I could save the dmesg output (The output shown 
> here is not from next-20260519 but from a step in the bisection).
> 
[..]
> So I reverted the this commit in next-20260519 (to get a clean revert I needed to
> revert commit
> 36b3306779ea ("fs: cache the string generated by reading /proc/filesystems") first.
> 
> $ git log --oneline
> c7321982a5d0 (HEAD -> rcu_critical_readside_bug) Revert "fs: RCU-ify filesystems list"
> 16ff8d6e7c28 Revert "fs: cache the string generated by reading /proc/filesystems"
> 6a50ba100ace (tag: next-20260519, origin/master, origin/HEAD, master) Add linux-next specific files for 20260519
> 
> With these reverts next-20260519 boots 30 times in a row without error, so
> it appears that commit dc651e25a6d2 ("fs: RCU-ify filesystems list") causing the
> error.
> 

I think the patch below will do the trick.

If someone wonders how come the missing unlocks: the original patch had
them in place, but when I was rebasing on top of the RCU-ifing commit I
figured I'm going to do guard/scoped_guard in there as well. Later it
started failing as the compiler did not like goto retry out of a scoped
guard area and the unlocks did not come back.

tl;dr there is definitely my bug here and it is most likely *the* bug

Christian, can you fold this in please.

diff --git a/fs/filesystems.c b/fs/filesystems.c
index 771fc31a69b8..8f17c0abbc95 100644
--- a/fs/filesystems.c
+++ b/fs/filesystems.c
@@ -289,6 +289,7 @@ static __cold noinline int regen_filesystems_string(void)
         * Did someone beat us to it?
         */
        if (old && old->gen == file_systems_gen) {
+               spin_unlock(&file_systems_lock);
                kfree(new);
                return 0;
        }
@@ -297,6 +298,7 @@ static __cold noinline int regen_filesystems_string(void)
         * Did the list change in the meantime?
         */
        if (gen != file_systems_gen) {
+               spin_unlock(&file_systems_lock);
                kfree(new);
                goto retry;
        }


