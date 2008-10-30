From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: tree build warning
Date: Thu, 30 Oct 2008 13:05:30 -0500 (CDT)
Message-ID: <Pine.LNX.4.64.0810301304320.29346@quilx.com>
References: <20081028181340.daec73cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:37542 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757972AbYJ3SPc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 14:15:32 -0400
In-Reply-To: <20081028181340.daec73cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

Another conflict with the zero based patchset. Zero based should have 
priority since the future cpu ops patchset on top of zero based and 
cpu_alloc will not work on x86_64 without it.
