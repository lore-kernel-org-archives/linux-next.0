From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] tty/powerpc: fix build break with ehv_bytechan.c on allyesconfig
Date: Thu, 25 Aug 2011 13:02:01 -0500
Message-ID: <4E568E19.405@freescale.com>
References: <1314289245-14946-1-git-send-email-timur@freescale.com> <20110825163234.GA31629@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110825163234.GA31629@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org

Greg KH wrote:
> tested doesn't mean that it shouldn't still build properly for other
> platforms, right?

The problem is the dependency on MSR_GS, which is defined only for Book-E
PowerPC chips, not all PowerPC.

So I gave it some more thought, and technically ePAPR extends beyond Book-E, so
it's wrong for the driver to depend on anything specific to Book-E.  I've
removed the code that breaks:

	/* Check if we're running as a guest of a hypervisor */
	if (!(mfmsr() & MSR_GS))
		return;

> What is keeping the driver from building on all PPC, or even all arches
> today?

I've made a few changes, and it builds on all PPC now.  I'll post a new patch.

-- 
Timur Tabi
Linux kernel developer at Freescale
