From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 19 (i7core_edac)
Date: Mon, 19 Sep 2011 14:20:53 -0700
Message-ID: <4E77B235.30403@xenotime.net>
References: <20110919190117.f5d02ff24b9ab7dc17035d75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110919190117.f5d02ff24b9ab7dc17035d75@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sedat Dilek <sedat.dilek@googlemail.com>, linux-edac@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

On 09/19/2011 02:01 AM, Stephen Rothwell wrote:
> Hi all,
> 
> The linux-next tree is now available from
> git://github.com/sfrothwell/linux-next.git as a temporary measure while
> the kernel.org servers are unavailable.
> 
> The powerpc allyesconfig build still fails today.
> 
> Changes since 20110916:

i7core_edac.c build still fails on i386:

ERROR: "__udivdi3" [drivers/edac/i7core_edac.ko] undefined!

[Untested/buggy ;] Fix was posted by Sedat Dilek here:
http://marc.info/?l=linux-next&m=131436817426589&w=2

on Aug. 26.  Just remove the last ')' in 2 places:

+			cache_line_size * 1000000);
and
+		1000000 * cache_line_size);

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
