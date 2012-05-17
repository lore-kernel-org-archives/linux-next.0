From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: linux-next: bad commit in the tile tree
Date: Wed, 16 May 2012 20:19:06 -0400
Message-ID: <4FB443FA.1070003@tilera.com>
References: <20120517091417.62c65eea7002be18d8af2f34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120517091417.62c65eea7002be18d8af2f34@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/16/2012 7:14 PM, Stephen Rothwell wrote:
> Hi Chris,
>
> The top commit on the tile tree has a bad description ("usb hackery" does
> not tell us anything), sprinkles stuff (mainly printk()s) all over the
> generic usb code and is not signed off by anyone ...
>
> I assume it is a debugging patch (or similar) and should *not* be in
> linux-next.
>
> I will use the version of the tile tree from next-20120516 for today
> (unless you update your tree very soon).

Oops :-)  It is debugging hackery.  I committed it to do work on a
different branch, which I then pushed, forgetting that by default I'd push
the linux-next branch as well.  Fixed now.  Sorry!

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
