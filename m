From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 13:51:36 -0400
Message-ID: <55241928.4060909@ezchip.com>
References: <20150407212153.33327869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150407212153.33327869@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>
List-Id: linux-next.vger.kernel.org

On 04/07/2015 07:21 AM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in
> kernel/watchdog.c between commit e164ade07b21 ("watchdog: add
> watchdog_exclude sysctl to assist nohz") from the tile tree and commits
> e0afaab242da ("watchdog: introduce separate handlers for parameters
> in /proc/sys/kernel"), 866d62a433cc ("watchdog: enable the new user
> interface of the watchdog mechanism") and 09d1b2261fcc ("watchdog:
> clean up some function names and arguments") from the akpm-current tree.
>
> I fixed it up (see below, but it may need more work) and can carry the
> fix as necessary (no action is required).

Thanks for the fixups.

I have removed the patch from the tile tree after rebasing it to the tip of
linux-next so as to properly handle the just-updated refactoring
in watchdog.c by Uli.

It probably makes most sense if Andrew can pick it up once
it has baked a bit longer on LKML and he can send it to you
that way.

-- 
Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com
