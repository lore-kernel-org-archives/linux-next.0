From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the arm tree
Date: Thu, 25 Aug 2011 16:28:18 +0200
Message-ID: <201108251628.18531.rjw@sisk.pl>
References: <20110825133014.4ca16d7b383f7582c7a52d46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110825133014.4ca16d7b383f7582c7a52d46@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Medhurst <tixy@yxit.co.uk>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thursday, August 25, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> arch/arm/mach-shmobile/board-ap4evb.c between commit 9b742024026c ("ARM:
> mach-shmobile: Setup consistent dma size at boot time") from the arm tree
> and commit 2f82df20d71c ("PM: Move clock-related definitions and headers
> to separate file") from the pm tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks a lot!
