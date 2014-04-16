From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: new 64 bit math link fail in xfs in linux-next today
Date: Wed, 16 Apr 2014 12:09:37 -0400
Message-ID: <534EAB41.60901@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:47357 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754922AbaDPQJe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Apr 2014 12:09:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: xfs@oss.sgi.com, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Dave,

Not sure if this has been reported yet, but this new failure showed
up in the xtensa link of today's linux-next builds.

http://kisskb.ellerman.id.au/kisskb/buildresult/10938384/

Paul.
