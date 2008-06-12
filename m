From: Alan Modra <amodra@bigpond.net.au>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 17:45:53 +0930
Message-ID: <20080612081553.GA22457@bubble.grove.modra.org>
References: <20080611192748.686236fd.sfr@canb.auug.org.au> <20080611095951.GB14033@elte.hu> <18512.32267.636550.47385@cargo.ozlabs.ibm.com> <20080612053335.GA22035@bubble.grove.modra.org> <20080612170505.6049fa75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nschwmtas04p.mx.bigpond.com ([61.9.189.146]:22665 "EHLO
	nschwmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750880AbYFLIP5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 04:15:57 -0400
Content-Disposition: inline
In-Reply-To: <20080612170505.6049fa75.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

On Thu, Jun 12, 2008 at 05:05:05PM +1000, Stephen Rothwell wrote:
> /usr/bin/ld: --relax and -r may not be used together

Can't you arrange so that --relax is only used on the final link?  Of
course, if you have mashed all the input .text sections together with
"ld -r", resulting in one monster .text then --relax quite likely
won't help.  ld can't break apart an input section to insert
trampolines in the middle.

-- 
Alan Modra
Australia Development Lab, IBM
