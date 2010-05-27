From: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Subject: Re: linux-next: build warning after merge of the kvm tree
Date: Thu, 27 May 2010 12:19:58 +0200
Message-ID: <20100527101957.GT3266@amd.com>
References: <20100527145307.0e6d537c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:11531 "EHLO
	TX2EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757336Ab0E0KXR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2010 06:23:17 -0400
Content-Disposition: inline
In-Reply-To: <20100527145307.0e6d537c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 27, 2010 at 12:53:07AM -0400, Stephen Rothwell wrote:
> After merging the kvm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> arch/x86/kvm/svm.c: In function 'svm_handle_mce':
> arch/x86/kvm/svm.c:1489: warning: unused variable 'kvm_run'
> 
> Introduced by commit 5c91e7b615f7b6b36f6ad32356bb786bed5b7764 ("KVM: SVM:
> Implement workaround for Erratum 383").

Fix for that is already posted and should be in the KVM tree soon.

	Joerg
