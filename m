From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 2/2] lib/scatterlist: use page iterator in the mapping
 iterator
Date: Sat, 23 Feb 2013 16:45:11 -0700
Message-ID: <51295487.7040602@wwwdotorg.org>
References: <1360768224-18163-1-git-send-email-imre.deak@intel.com> <1360768224-18163-2-git-send-email-imre.deak@intel.com> <51284595.5040903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56761 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753551Ab3BWXpO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Feb 2013 18:45:14 -0500
In-Reply-To: <51284595.5040903@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Maxim Levitsky <maximlevitsky@gmail.com>, Tejun Heo <tj@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linaro-mm-sig@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Sat, 23 Feb 2013 22:04:06 +0200, Imre Deak wrote:
> On Fri, 2013-02-22 at 21:29 -0700, Stephen Warren wrote:
>> On 02/13/2013 08:10 AM, Imre Deak wrote:
>>> For better code reuse use the newly added page iterator to iterate
>>> through the pages. The offset, length within the page is still
>>> calculated by the mapping iterator as well as the actual mapping.
>>> Idea from Tejun Heo <tj@kernel.org>.
>>
>> This patch appears in linux-next since next-20130220. It breaks mounting
>> a root filesystem on an SD card on the Raspberry Pi ARM platform, with
>> errors such as those shown below.
>>
>> next-20130222 with just this patch reverted works fine.
> 
> ...
> the following might fix the
> problem you saw. Could you give it a try? It applies on top of
> v4 of the patch [1]:

Yes, thanks very much. That incremental patch you gave solves the
problem perfectly.
