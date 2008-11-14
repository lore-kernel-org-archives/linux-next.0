From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: linux-next: Tree for November 14 (staging#2)
Date: Fri, 14 Nov 2008 18:53:43 -0500
Message-ID: <3aaafc130811141553oa5f05c8m1615dc37c7e56cd2@mail.gmail.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
	 <20081114101111.f138c2ba.randy.dunlap@oracle.com>
	 <3aaafc130811141413u7d1ee054g9690f1837d96ae6d@mail.gmail.com>
	 <491E0252.1080801@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.235]:8293 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751844AbYKNXxn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 18:53:43 -0500
Received: by rv-out-0506.google.com with SMTP id k40so1607691rvb.1
        for <linux-next@vger.kernel.org>; Fri, 14 Nov 2008 15:53:43 -0800 (PST)
In-Reply-To: <491E0252.1080801@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hrm, I get

linux-next/arch/x86/include/asm/page_64.h:46:2: error: #error
"CONFIG_PHYSICAL_START must be a multiple of 2MB"

And when I ran make I still had to choose options. Maybe it's my
architecture/build chain, but I don't know if I can help with this
one.
