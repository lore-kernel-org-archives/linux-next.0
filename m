From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 13:43:44 -0700
Message-ID: <7vboao73i7.fsf@alter.siamese.dyndns.org>
References: <20130312100950.e45ef0e721492ff0d5fd7c8d@canb.auug.org.au>
 <alpine.LRH.2.02.1303121510270.25612@tundra.namei.org>
 <20130312041641.GE18595@thunk.org>
 <20130312161823.86ea101fc4e45285b205817f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from b-pb-sasl-quonix.pobox.com ([208.72.237.35]:40519 "EHLO
	smtp.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932514Ab3CLUnq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Mar 2013 16:43:46 -0400
In-Reply-To: <20130312161823.86ea101fc4e45285b205817f@canb.auug.org.au>
 (Stephen Rothwell's message of "Tue, 12 Mar 2013 16:18:23 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, James Morris <jmorris@namei.org>, Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> I wonder if "git merge v3.9-rc2^{}" should work.

With less typing, "git merge v3.9-rc2^0", is the more traditional
way, but "git merge v3.9-rc2^{}" should also work.
