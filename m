From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: zero based percpu build error on s390
Date: Wed, 9 Jul 2008 17:44:03 +0200
Message-ID: <20080709154402.GA24868@elte.hu>
References: <20080703193009.GA8958@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45880 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753819AbYGIPoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 11:44:19 -0400
Content-Disposition: inline
In-Reply-To: <20080703193009.GA8958@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Mike Travis <travis@sgi.com>, linux-next@vger.kernel.org


* Heiko Carstens <heiko.carstens@de.ibm.com> wrote:

> The patch:
> "Zero based percpu: infrastructure to rebase the per cpu area to zero"
> 
> causes this build error on !CONFIG_SMP on linux-next / s390:

> Fix below. Please merge with original patch.

applied to tip/core/percpu - thanks Heiko!

	Ingo
