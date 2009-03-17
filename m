From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH next] slob: fix build problem
Date: Tue, 17 Mar 2009 10:04:33 +0100
Message-ID: <20090317090433.GE16952@elte.hu>
References: <20090317082549.GA5127@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58340 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755293AbZCQJEl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2009 05:04:41 -0400
Content-Disposition: inline
In-Reply-To: <20090317082549.GA5127@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Nick Piggin <npiggin@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org


* Alexander Beregalov <a.beregalov@gmail.com> wrote:

> mm/slob.c: In function '__kmalloc_node':
> mm/slob.c:480: error: 'flags' undeclared (first use in this function)
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

thanks, fixed it two days ago:

  bf722c9: lockdep: annotate reclaim context (__GFP_NOFS), fix SLOB

also posted on lkml.

	Ingo
