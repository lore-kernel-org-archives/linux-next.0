From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [ofa-general] Re: linux-next: Tree for February 9 (infiniband)
Date: Mon, 09 Feb 2009 09:01:11 -0800
Message-ID: <49906157.9090707@oracle.com>
References: <20090209193908.1a448944.sfr@canb.auug.org.au>
	<49905F93.300@oracle.com> <49906118.3060801@opengridcomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <49906118.3060801@opengridcomputing.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Steve Wise <swise@opengridcomputing.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, swise@chelsio.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

Steve Wise wrote:
> Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>>  
>>> Hi all,
>>>
>>> [I accidentally deleted the merge and quilt-import logs today :-( - I
>>> wonder if any would have noticed :-).  The merge summary still appears
>>> below.]
>>>
>>> Changes since 20090206:
>>>     
>>
>>
>> allyesconfig build on i386 fails with:
>>
>> drivers/built-in.o: In function `iwch_sgl2pbl_map':
>> /usr/builds/linux-next-20090209/drivers/infiniband/hw/cxgb3/iwch_qp.c:237:
>> undefined reference to `__umoddi3'
>> make: *** [.tmp_vmlinux1] Error 1
>>
>>
>> or allmodconfig on i386 fails with:
>>
>> ERROR: "__umoddi3" [drivers/infiniband/hw/cxgb3/iw_cxgb3.ko] undefined!
>>
>>   
> 
> Somehow changing offset to a u64 must have caused this.  What is
> __umoddi3?  (it can't be good) :)

It's some kind of mod operation, like 64-bit % 32-bit or
64-bit % 64-bit.  Should be in a fairly recent change.


-- 
~Randy
