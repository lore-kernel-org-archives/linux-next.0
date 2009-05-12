From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH -next] kvm: fix build error: add missing semi-colon
Date: Tue, 12 May 2009 11:31:21 +0300
Message-ID: <4A0933D9.5090305@redhat.com>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A085326.3030707@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37543 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753522AbZELIcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 04:32:14 -0400
In-Reply-To: <4A085326.3030707@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Add missing ; to fix build error:
>
> arch/x86/kvm/x86.c:1259: error: expected',' or ';' before 'const'
>
>   

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function
