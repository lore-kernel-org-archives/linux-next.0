From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: Tree for December 15 (netlabel)
Date: Mon, 15 Dec 2008 16:35:58 -0500
Message-ID: <200812151635.59170.paul.moore@hp.com>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au> <4946AE5C.9040207@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4946AE5C.9040207@oracle.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Monday 15 December 2008 2:22:04 pm Randy Dunlap wrote:
> netlabel_domainhash fails to build when IPV6 is not enabled:
>
> build-r7133.out:/local/linsrc/linux-next-20081215/net/netlabel/netlab
>el_domainhash.c:527: error: implicit declaration of function
> 'netlbl_af6list_foreach_rcu'
> build-r7133.out:/local/linsrc/linux-next-20081215/net/netlabel/netlab
>el_domainhash.c:528: error: expected ';' before 'goto'
> build-r7133.out:make[3]: *** [net/netlabel/netlabel_domainhash.o]
> Error 1

Thanks.  I just fixed this and update the lblnet-2.6_next tree; it 
should be in tomorrow's next.

-- 
paul moore
linux @ hp
