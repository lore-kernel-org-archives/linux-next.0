From: Avi Kivity <avi@qumranet.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 26 Aug 2008 10:39:49 +0300
Message-ID: <48B3B345.9000409@qumranet.com>
References: <20080826144542.9dabd12e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from il.qumranet.com ([212.179.150.194]:48315 "EHLO il.qumranet.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752100AbYHZHju (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 03:39:50 -0400
In-Reply-To: <20080826144542.9dabd12e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>

Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next merge of the kvm tree got a conflict in
> include/linux/kvm.h between commit
> 1327138e294ffda120a50c8f31d792addb196c79 ("KVM: fix userspace ABI
> breakage") from Linus' tree (a version of which which also exists in the
> kvm tree) and commit b8486fbae0046883437c91e9b475f1878888fe72 ("KVM:
> kvmtrace: replace get_cycles with ktime_get v3") from the kvm tree.
>
> I used the version from the kvm tree.
>   

Fixed it up; thanks.

-- 
error compiling committee.c: too many arguments to function
