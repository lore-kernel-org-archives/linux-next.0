From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-current
 tree
Date: Wed, 11 Jul 2018 22:56:44 +0100
Message-ID: <20180711215644.GA18831@flint.armlinux.org.uk>
References: <20180712073803.7bfbbf1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712073803.7bfbbf1a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 12, 2018 at 07:38:03AM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> Commit
> 
>   6ef09e48c2bc ("ARM: 8780/1: ftrace: Only set kernel memory back to read-only after boot")
> 
> is missing a Signed-off-by from its author.

Thanks for spotting, but it's worse than that.  It does have a sign-off
from its author, but the authorship wasn't preserved by Stefan Agner
(no From: line in the email body, as there was in Steven's original
post to the mailing list.)  I'll fix that in the next few days.

-- 
Russell King
ARM architecture Linux Kernel maintainer
