From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Missing next-$date git-tag when pulled-in linux-next.git on top of linus.git
Date: Wed, 7 Jan 2015 09:24:57 +0100
Message-ID: <CA+icZUVVPe68VGwRcc5ztxGwHi83wHJVeiJMUuBynm2LypoaZA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

My workflow looks like this

# Get mainline Git tree
$ git clone $LINUS_GIT_URL

# Checkout latest mainline (rc) tag (aka -next's "origin" commit-id)
$ git checkout -b Linux-v3.19-rc3 v3.19-rc3

# Base to pull in current -next
$ git checkout -b Linux-next-20150107

# Pull in stuff from next-20150107
$ git pull git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
tags/next-20150107

Unfortunately, this is not getting the git-tag "next-20150107" which I fix by...

$ git tag next-20150107

Do you happen to know how to do that more elegant?

( I wanted to avoid to run... git pull $git_url --tags ... which gets
all -next tags. )

Thanks.

- Sedat -
