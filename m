From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: broken tty-move-canon-specials patch
Date: Tue, 2 Sep 2008 18:59:39 +0400
Message-ID: <20080902145939.GA4864@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.188]:45185 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbYIBO6C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 10:58:02 -0400
Received: by mu-out-0910.google.com with SMTP id g7so2411281muf.1
        for <linux-next@vger.kernel.org>; Tue, 02 Sep 2008 07:58:01 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: alan@redhat.com
Cc: linux-next@vger.kernel.org

1. n_tty_set_termios() unconditionally dereferences termios pointer
2. n_tty_open() does n_tty_set_termios(tty, NULL)

which results in panic at boot.
