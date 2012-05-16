From: Alexander Graf <agraf@suse.de>
Subject: Re: linux-next: build failure after merge of the kvm-ppc tree
Date: Wed, 16 May 2012 11:19:35 +0200
Message-ID: <4FB37127.8070507@suse.de>
References: <20120516172416.781859dbc2febbda67407576@canb.auug.org.au> <20120516091501.GA30694@bloggs.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47635 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932936Ab2EPJTk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 May 2012 05:19:40 -0400
In-Reply-To: <20120516091501.GA30694@bloggs.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/16/2012 11:15 AM, Paul Mackerras wrote:
> On Wed, May 16, 2012 at 05:24:16PM +1000, Stephen Rothwell wrote:
>> Hi Alexander,
>>
>> After merging the kvm-ppc tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> ERROR: "kvm_hpt_order" [arch/powerpc/kvm/kvm.ko] undefined!
>>
>> Caused by commit ec26346431bb ("KVM: PPC: Book3S HV: Make the guest hash
>> table size configurable").
> Oops, my fault, kvm_hpt_order needs to be exported for when KVM is
> a module.  Patch coming.

Fixed in kvm-ppc-next. Sorry for the noise.


Alex
