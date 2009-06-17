From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm/powerpc tree build failure
Date: Wed, 17 Jun 2009 17:04:12 +0300
Message-ID: <4A38F7DC.3030206@redhat.com>
References: <20090617150419.e406a69a.sfr@canb.auug.org.au>	<4A38F47F.509@redhat.com> <20090617235546.95aa39a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:53094 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755547AbZFQOEX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 10:04:23 -0400
In-Reply-To: <20090617235546.95aa39a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

On 06/17/2009 04:55 PM, Stephen Rothwell wrote:
> Hi Avi,
>
> On Wed, 17 Jun 2009 16:49:51 +0300 Avi Kivity<avi@redhat.com>  wrote:
>    
>> Thanks, applied.  For some reason my own build testing didn't fail on this.
>>      
>
> Thanks.  It could be a different compiler version doesn't complain (I am
> currently using 4.4.0) and the powerpc tree has a patch to build parts of
> arch/powerpc with -Werror which makes it stand out a bit :-)
>    

Ah yes, you did mention it was a warning.

-- 
Do not meddle in the internals of kernels, for they are subtle and quick to panic.
