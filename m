From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Fri, 13 Dec 2013 06:54:55 +0800
Message-ID: <1386888895.2586.5.camel@ThinkPad-T5421>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
	 <20131211.164946.912458698857068460.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:47619 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894Ab3LLBzi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 20:55:38 -0500
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Thu, 12 Dec 2013 07:25:35 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 4235BE0024
	for <linux-next@vger.kernel.org>; Thu, 12 Dec 2013 07:27:52 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rBC1tQQO29819090
	for <linux-next@vger.kernel.org>; Thu, 12 Dec 2013 07:25:26 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rBC1tVis009696
	for <linux-next@vger.kernel.org>; Thu, 12 Dec 2013 07:25:31 +0530
In-Reply-To: <20131211.164946.912458698857068460.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, dborkman@redhat.com, brouer@redhat.com

On Wed, 2013-12-11 at 16:49 -0500, David Miller wrote:
> Please send networking patches to netdev@vger.kernel.org, otherwise they
> will get lost.
> 
Thank you for the reminder :)

Zhong
