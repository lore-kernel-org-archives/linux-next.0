From: "Randy Dunlap" <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 26 (i7core_edac)
Date: Fri, 26 Aug 2011 01:07:50 -0700
Message-ID: <205ae102ed038641e32cf38c48334f9e.squirrel@xenotime.net>
References: <20110826150000.302334d0b86c17cd9b89b590@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110826150000.302334d0b86c17cd9b89b590@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org
List-Id: linux-next.vger.kernel.org


On Thu, August 25, 2011 10:00 pm, Stephen Rothwell wrote:
> Hi all,
>
> The powerpc allyesconfig build still fails today.
>
> Changes since 20110825:


on i386:

ERROR: "__udivdi3" [drivers/edac/i7core_edac.ko] undefined!

in both get_sdram_scrub_rate()
and set_sdram_scrub_rate()

-- 
~Randy
