From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Fri, 12 Sep 2008 12:53:40 -0700
Message-ID: <48CAC8C4.90302@linux.intel.com>
References: <20080913055017.f54fbf66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27675 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752301AbYILTxm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 15:53:42 -0400
In-Reply-To: <20080913055017.f54fbf66.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>

Stephen Rothwell wrote:
> Hi Avi,
> 
> Today's linux-next merge of the kvm tree got a conflict in
> arch/x86/kvm/i8254.c between commit
> beb20d52d03a51218827fb4a36a4b583debb03f9 ("hrtimer: convert kvm to the
> new hrtimer apis") from the timers tree and commit
> 3dceed526eaab43af90bcec3476c4f534f98dd41 ("KVM: PIT: fix injection logic
> and count") from the kvm tree.
> 
> Just contextual. I fixed it up (see below) and can carry the fix.


Stephen: one option is to push the "introduce the new apis" patch to Linus
now (it just adds apis, nothing more); with that done it's possible to
push all the conversions via the separate maintainer git trees...

(not that it's all THAT painful right now, but still)
