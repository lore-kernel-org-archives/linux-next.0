From: "Matti Linnanvuori" <mattilinn@gmail.com>
Subject: [regression] Tree for July 21 make rpm fails because of binaries
Date: Tue, 22 Jul 2008 17:13:51 +0300
Message-ID: <ca0148c30807220713q7934a42dw59e96a8aa5b947b9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.169]:62395 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753253AbYGVONx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 10:13:53 -0400
Received: by wf-out-1314.google.com with SMTP id 27so2210207wfd.4
        for <linux-next@vger.kernel.org>; Tue, 22 Jul 2008 07:13:51 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Tree for July 21 make rpm fails because of some drivers' like e100's
binaries being installed but not declared.
