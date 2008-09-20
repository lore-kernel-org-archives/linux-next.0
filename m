From: Avi Kivity <avi@qumranet.com>
Subject: Re: [PATCH] kvm: x86.c make kvm_load_realmode_segment static
Date: Fri, 19 Sep 2008 19:06:44 -0700
Message-ID: <48D45AB4.6070300@qumranet.com>
References: <1219436957.4493.8.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from il.qumranet.com ([212.179.150.194]:39550 "EHLO il.qumranet.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752011AbYITCGl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Sep 2008 22:06:41 -0400
In-Reply-To: <1219436957.4493.8.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next <linux-next@vger.kernel.org>

Harvey Harrison wrote:
> Noticed by sparse:
> arch/x86/kvm/x86.c:3591:5: warning: symbol 'kvm_load_realmode_segment' was not declared. Should it be static?
>
> Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> ---
> Appeared between next-20080820 and next-20080821
>   

Applied, thanks.

-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.
