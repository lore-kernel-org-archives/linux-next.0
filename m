From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: linux-next: Please add the fsi tree
Date: Fri, 22 Jun 2018 11:53:50 +1000
Message-ID: <c304c6e08d7baa6e725c2634ea94b7fa326edd5a.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen !

Please add the fsi tree at

https://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git (master)

To linux-next. It contains the changes that I will send to Greg KH to the FSI
subsystem used by the service processor to communicate with IBM Power chips
(and eventually S390 as well).

Commits in there are intende to be merged via Greg's tree. Signed tags in
there have already been the subject of pull requests to Greg.

Thanks !

Cheers,
Ben.
