From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 13 Aug 2009 11:58:20 +0300
Message-ID: <4A83D5AC.1030503@redhat.com>
References: <20090813125840.048af293.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:59798 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753326AbZHMI61 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2009 04:58:27 -0400
In-Reply-To: <20090813125840.048af293.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/13/2009 05:58 AM, Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> x86_64-linux-gcc: arch/x86/kvm/x86_emulate.c: No such file or directory
>
> Caused by commit 5383e9982ee230b06b3c385e675ae6fc7846c40f ("KVM: Rename
> x86_emulate.c to emulate.c").
>
> I have used the version of the kvm tree from next-20090812 for today.
>    

Fixed now, don't know how such brokenness slipped out.

-- 
error compiling committee.c: too many arguments to function
