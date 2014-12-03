From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the kselftest tree with the
 kselftest-fixes tree
Date: Wed, 03 Dec 2014 22:56:37 +1100
Message-ID: <1417607797.23663.1.camel@concordia>
References: <20141203203210.2eef1e6c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141203203210.2eef1e6c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2014-12-03 at 20:32 +1100, Stephen Rothwell wrote:
> Hi Shuah,
> 
> Today's linux-next merge of the kselftest tree got a cselftests/kcmp:
> Always try to build the testonflict in
> tools/testing/selftests/kcmp/Makefile between commit 4c12df63f7ff ("")
> from the kselftest-fixes tree and commit c0d8a9393efd
> ("selftests/kcmp: add install target to enable installing test") from
> the kselftest tree.

That got a bit mixed up, I think it should be:

  Today's linux-next merge of the kselftest tree got a conflict in
  tools/testing/selftests/kcmp/Makefile between commit 4c12df63f7ff
  ("selftests/kcmp: Always try to build the test") from the kselftest-fixes
  tree and commit c0d8a9393efd ("selftests/kcmp: add install target to enable
  installing test") from the kselftest tree.

> I fixed it up (see below - probably some more could be done) and can
> carry the fix as necessary (no action is required).

That resolution basically negates the effect of the first patch.

Shuah, seeing these are both your trees are you happy to do the proper
resolution?

cheers
