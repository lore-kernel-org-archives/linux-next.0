From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 26 (gpu vs. staging/gma500)
Date: Tue, 26 Jul 2011 14:30:23 -0700
Message-ID: <20110726143023.cc2d7f81.rdunlap@xenotime.net>
References: <20110726155744.5c1bee67177bd94211ed8c2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:38232 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753112Ab1GZVaZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2011 17:30:25 -0400
In-Reply-To: <20110726155744.5c1bee67177bd94211ed8c2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, alan@linux.intel.com

On Tue, 26 Jul 2011 15:57:44 +1000 Stephen Rothwell wrote:

> Hi all,

drivers/staging/built-in.o: In function `drm_gem_private_object_init':
(.text+0x8e170): multiple definition of `drm_gem_private_object_init'
drivers/gpu/built-in.o:(.text+0x9a20): first defined here


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
