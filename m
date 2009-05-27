From: Gerard Lledo <gerard.lledo@gmail.com>
Subject: [PATCH] (linux-next) Cleanups in drivers/staging/comedi
Date: Wed, 27 May 2009 17:35:17 +0300
Message-ID: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:6782 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755360AbZE0OfW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 10:35:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-janitors@vger.kernel.org
Cc: linux-next@vger.kernel.org


These are 2 small patches that fix one warning and a build faulure in the
comedi subsystem.  Both of them were build-tested.
