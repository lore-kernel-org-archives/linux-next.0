From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: build fails: drm/bridge: make bridge registration independent of
 drm flow
Date: Wed, 28 Jan 2015 18:02:22 -0500
Message-ID: <54C96A7E.2000207@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:61771 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752398AbbA2EIb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Jan 2015 23:08:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thierry Reding <treding@nvidia.com>

Hi Ajay,

While doing build testing of linux-next I got a build
failure.

I found that you'd removed a function in your commit
(see subject) but callers still exist:

$ git grep drm_bridge_cleanup
drivers/gpu/drm/bridge/dw_hdmi.c:       drm_bridge_cleanup(bridge);
drivers/gpu/drm/sti/sti_dvo.c:  drm_bridge_cleanup(bridge);
drivers/gpu/drm/sti/sti_dvo.c:  drm_bridge_cleanup(bridge);
$

You probably want to fix up those remaining files and resubmit.

Thanks,
Paul.


 
