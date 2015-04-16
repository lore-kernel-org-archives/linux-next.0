From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on score/paris/..
Date: Thu, 16 Apr 2015 13:19:42 +0930
Message-ID: <87mw28rauh.fsf@rustcorp.com.au>
References: <20150414165000.GA19434@roeck-us.net> <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com> <552E6722.1080507@roeck-us.net> <20150415211956.GA6703@chrystal.uk.oracle.com> <552F13AF.5030606@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42207 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752516AbbDPDuX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Apr 2015 23:50:23 -0400
In-Reply-To: <552F13AF.5030606@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

Guenter Roeck <linux@roeck-us.net> writes:
>  >From 2e9abac9cbde18af48951c54d52c9c515f9883a7 Mon Sep 17 00:00:00 2001
> From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
> Date: Wed, 15 Apr 2015 22:39:50 +0200
> Subject: [PATCH] modpost: do not try to match the SHT_NUL section.
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter, for all your testing and feedback!

Applied (all 3)
Rusty.
