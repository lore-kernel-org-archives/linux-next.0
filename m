From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 24 (netup_unidvb & if)
Date: Thu, 24 Sep 2015 10:53:16 -0700
Message-ID: <5604388C.2040604@infradead.org>
References: <20150924145335.2674d15d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150924145335.2674d15d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
List-Id: linux-next.vger.kernel.org

On 09/23/15 21:53, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150923:
> 

on x86_64:


In file included from ../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:34:0:
../drivers/media/dvb-frontends/horus3a.h:51:13: warning: 'struct cxd2820r_config' declared inside parameter list [enabled by default]
      struct i2c_adapter *i2c)
             ^
../drivers/media/dvb-frontends/horus3a.h:51:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
In file included from ../include/linux/init.h:4:0,
                 from ../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:21:
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c: In function 'netup_unidvb_dvb_init':
../include/linux/compiler.h:150:17: warning: passing argument 1 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:28: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                            ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'const struct cxd2820r_config *' but argument is of type 'struct dvb_frontend *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:28: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                            ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: warning: passing argument 2 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:28: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                            ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'struct i2c_adapter *' but argument is of type 'struct horus3a_config *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:28: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                            ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: error: too many arguments to function '__a'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:28: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                            ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: warning: passing argument 1 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:40: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                                        ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'const struct cxd2820r_config *' but argument is of type 'struct dvb_frontend *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:40: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                                        ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: warning: passing argument 2 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:40: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                                        ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'struct i2c_adapter *' but argument is of type 'struct horus3a_config *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:40: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                                        ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: error: too many arguments to function '__a'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:147:40: note: in definition of macro '__trace_if'
  if (__builtin_constant_p((cond)) ? !!(cond) :   \
                                        ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: warning: passing argument 1 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:158:16: note: in definition of macro '__trace_if'
   ______r = !!(cond);     \
                ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'const struct cxd2820r_config *' but argument is of type 'struct dvb_frontend *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:158:16: note: in definition of macro '__trace_if'
   ______r = !!(cond);     \
                ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: warning: passing argument 2 of '__a' from incompatible pointer type [enabled by default]
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:158:16: note: in definition of macro '__trace_if'
   ______r = !!(cond);     \
                ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: note: expected 'struct i2c_adapter *' but argument is of type 'struct horus3a_config *'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:158:16: note: in definition of macro '__trace_if'
   ______r = !!(cond);     \
                ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^
../include/linux/compiler.h:150:17: error: too many arguments to function '__a'
   static struct ftrace_branch_data   \
                 ^
../include/linux/compiler.h:158:16: note: in definition of macro '__trace_if'
   ______r = !!(cond);     \
                ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:2: note: in expansion of macro 'if'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
  ^
../include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
 #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                       ^
../drivers/media/dvb-core/dvbdev.h:238:2: note: in expansion of macro 'if'
  if (__a) { \
  ^
../drivers/media/pci/netup_unidvb/netup_unidvb_core.c:417:7: note: in expansion of macro 'dvb_attach'
  if (!dvb_attach(horus3a_attach, fe0->dvb.frontend,
       ^


-- 
~Randy
