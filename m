From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Fix arch/x86/kernel/genx2apic_uv_x.c build warning
	when !CONFIG_HOTPLUG_CPU
Date: Thu, 20 Nov 2008 09:03:16 +0100
Message-ID: <20081120080316.GB21785@elte.hu>
References: <1227135915-32628-1-git-send-email-aciddeath@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54193 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753510AbYKTID3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 03:03:29 -0500
Content-Disposition: inline
In-Reply-To: <1227135915-32628-1-git-send-email-aciddeath@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Richard A. Holden III" <aciddeath@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>


* Richard A. Holden III <aciddeath@gmail.com> wrote:

> Fix
> arch/x86/kernel/genx2apic_uv_x.c:403: warning: 'uv_heartbeat_disable' defined but not used
> 
> the function is only used when CONFIG_HOTPLUG_CPU is defined.

applied to tip/x86/uv, thanks Richard!

	Ingo
