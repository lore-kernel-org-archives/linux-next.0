From: Roland Dreier <rdreier@cisco.com>
Subject: Re: patchwork.kernel.org down
Date: Mon, 10 Jan 2011 12:53:20 -0800
Message-ID: <adasjx07a67.fsf@cisco.com>
References: <AANLkTik4ktaeyDG3ihh-YRB+WVLxA46wSLOgWy6iY_68@mail.gmail.com>
	<20101220204936.GA21290@huya.qualcomm.com>
	<4D0FFC4B.9050301@kernel.org> <ada62u3dkv2.fsf@cisco.com>
	<adaei8k8ubh.fsf@cisco.com> <4D2B664F.7050106@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-4.cisco.com ([171.68.10.86]:28994 "EHLO
	sj-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752061Ab1AJUxl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Jan 2011 15:53:41 -0500
In-Reply-To: <4D2B664F.7050106@kernel.org> (J. H.'s message of "Mon, 10 Jan
	2011 12:04:31 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J.H." <warthog9@kernel.org>
Cc: David Brown <davidb@codeaurora.org>, sedat.dilek@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ftpadmin@kernel.org, webmaster@kernel.org

 > I haven't added it to 20702 yet as I haven't had time to confirm if it's
 > the same issue, but at first glance it looks it.  My plan is to compile
 > up a mainline kernel, with the above patch, and with debugging turned on
 > and to capture as much as I can from that.

By the way, it is probably a good idea to boot with "slub_debug=FZP" to
make sure that slub debugging is turned on at runtime (unless you're
building at kernel with CONFIG_SLUB_DEBUG_ON=y, which I'm sure Fedora
doesn't do).  The crashes you're seeing definitely look like corruption
in the allocator.

 - R.
