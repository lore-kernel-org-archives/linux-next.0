From: David Miller <davem@davemloft.net>
Subject: Re: New build failures in sparc.
Date: Tue, 13 Mar 2012 15:48:48 -0700 (PDT)
Message-ID: <20120313.154848.265971549311147422.davem@davemloft.net>
References: <CAP=VYLpfM0AFWQp7Q=xYHnCd_6vEXKKL1EL5daGcO9gsJZH=7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLpfM0AFWQp7Q=xYHnCd_6vEXKKL1EL5daGcO9gsJZH=7Q@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
To: paul.gortmaker@windriver.com
Cc: sparclinux@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Tue, 13 Mar 2012 18:28:18 -0400

> Just a heads up that these turned up today in linux-next:

You must have updated your sparc binutils recently, which is now more
strict about making sure the proper options are passed to enable v8
instructions.

See also:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50979
