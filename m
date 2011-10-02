From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH] KVM: x86: Use do_div for tsc deadline calculation
Date: Sun, 02 Oct 2011 11:05:02 +0200
Message-ID: <4E88293E.5050006@redhat.com>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au> <4E84CC00.8090702@xenotime.net> <20110930085810.11bc8e2e38e1400a8b0b4cec@canb.auug.org.au> <4E85ACFC.1090509@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34824 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751515Ab1JBJFO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Oct 2011 05:05:14 -0400
In-Reply-To: <4E85ACFC.1090509@siemens.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Liu >> \"Liu, Jinsong\"" <jinsong.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>

On 09/30/2011 02:50 PM, Jan Kiszka wrote:
> Required on i386 hosts.
>
>

Thanks, applied.

-- 
error compiling committee.c: too many arguments to function
