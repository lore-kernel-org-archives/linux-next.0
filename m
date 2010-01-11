From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Mon, 11 Jan 2010 12:27:49 +0200
Message-ID: <4B4AFD25.1080001@redhat.com>
References: <20100111190749.0a74d445.Stephen@Rothwell.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:2100 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752915Ab0AKK2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 05:28:00 -0500
In-Reply-To: <20100111190749.0a74d445.Stephen@Rothwell.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <Stephen@Rothwell.id.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>

On 01/11/2010 10:07 AM, Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
>
>    

I pushed out a fix from Alex.

-- 
error compiling committee.c: too many arguments to function
