From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 16 Mar 2016 22:29:41 +1100
Message-ID: <20160316222941.4be25283@canb.auug.org.au>
References: <20160316105851.015ff688@canb.auug.org.au>
	<56E91108.5050105@bmw-carit.de>
	<56E911C2.3060802@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40044 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934141AbcCPL3r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 07:29:47 -0400
In-Reply-To: <56E911C2.3060802@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Daniel Wagner <daniel.wagner@bmw-carit.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Michal,

On Wed, 16 Mar 2016 08:56:50 +0100 Michal Marek <mmarek@suse.cz> wrote:
>
> Right. Stephen, could you perhaps move the kbuild tree down in your list
> a bit, so that the fixes are present?

Done.

Now you just need to make sure Linus gets them in the right order :-)
-- 
Cheers,
Stephen Rothwell
