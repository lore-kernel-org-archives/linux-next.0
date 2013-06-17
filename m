From: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the kvm tree
Date: Mon, 17 Jun 2013 20:23:48 +0800
Message-ID: <51BEFFD4.6090904@linux.vnet.ibm.com>
References: <20130617180735.c10c058469ce0633c65225a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:39295 "EHLO
	e28smtp08.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932813Ab3FQMYE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 08:24:04 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <xiaoguangrong@linux.vnet.ibm.com>;
	Mon, 17 Jun 2013 17:45:43 +0530
In-Reply-To: <20130617180735.c10c058469ce0633c65225a4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>

Hi Stephen,

Thanks for your work!

On 06/17/2013 04:07 PM, Stephen Rothwell wrote:

> - 		prepare_zap_oldest_mmu_page(kvm, &invalid_list);
> + 		freed += prepare_zap_oldest_mmu_page(kvm, &invalid_list);

It seems this change is not needed? and "freed" is not defined in mmu_shrink().
Right?
