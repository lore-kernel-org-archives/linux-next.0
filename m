From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 28 (fs-writeback)
Date: Wed, 28 Dec 2011 12:24:13 -0800
Message-ID: <4EFB7AED.1090408@xenotime.net>
References: <20111228201806.d6de27fa2dbd9e3a3b7a2603@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:36861 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754128Ab1L1TYy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Dec 2011 14:24:54 -0500
In-Reply-To: <20111228201806.d6de27fa2dbd9e3a3b7a2603@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On 12/28/2011 01:18 AM, Stephen Rothwell wrote:
> Hi all,
> 
> I got bored :-(  I also hate tree wide, flag day changes :-(
> 
> Changes since 20111222:


(on both i386 and x86_64 builds:)


fs/fs-writeback.c:510:11: error: 'PAGE_CACHE_SHIFT' undeclared (first use in this function)


Needs to #include <linux/pagemap.h> ??

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
