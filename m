From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH percpu/for-3.18-consistent-ops] Revert "powerpc: Replace
 __get_cpu_var uses"
Date: Wed, 27 Aug 2014 10:56:27 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1408271055030.17080@gentwo.org>
References: <20140827142243.6277eaff@canb.auug.org.au> <20140827152609.GA379@htj.dyndns.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96]:40630 "EHLO
	qmta09.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S935029AbaH0P4b (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2014 11:56:31 -0400
In-Reply-To: <20140827152609.GA379@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Wed, 27 Aug 2014, Tejun Heo wrote:

> Chrisoph, let's route the updated patch through powerpc tree.

Ok. Once I figure out what went wrong. This went through Feng's build
system and I though he did a powerpc build. So it must be a difference
configuration on powerpc.
